import Foundation
import Apollo
import ApolloAPI

final class Canceller: @unchecked Sendable {
    private let lock = NSLock()
    private lazy var serialQueue = DispatchQueue(label: "\(String(describing: Canceller.self))-\(String(describing: ObjectIdentifier(self)))")
    private var isCancelled = false
    private weak var cancellable: (any Cancellable)?

    func cancel() {
        lock.lock()
        self.isCancelled = true
        self.cancellable?.cancel()
        lock.unlock()
    }

    func setCancellable(_ cancellable: any Cancellable) {
        serialQueue.async { [weak self, weak cancellable] in
            if self?.isCancelled == true {
                cancellable?.cancel()
            }
            self?.cancellable = cancellable
        }
    }
}

extension ApolloClientProtocol {
    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        contextIdentifier: UUID? = nil,
        context: RequestContext? = nil,
        queue: DispatchQueue = .global(qos: .background)
    ) async throws -> Query.Data.Entity where Query.Data: EntityConvertible {
        let canceller = Canceller()
        return try await withTaskCancellationHandler {
            return try await withCheckedThrowingContinuation { continuation in
                let cancellable = fetch(query: query, cachePolicy: cachePolicy, contextIdentifier: contextIdentifier, context: context, queue: queue) {  result in
                    switch result {
                    case .success(let graphQLResult):
                        guard let data = graphQLResult.data else {
                            continuation.resume(throwing: GraphQLError.convertFailure)
                            return
                        }
                        do {
                            continuation.resume(returning: try data.convertedToEntity())
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
                canceller.setCancellable(cancellable)
            }
        } onCancel: {
            canceller.cancel()
        }
    }
}
