import Foundation
import Apollo
import ApolloAPI

actor CancelableHolder {
    private init() {}
    private var cancellables: [UUID: any Cancellable] = [:]
    
    static var shared = CancelableHolder()
    func setCancellable(uuid: UUID, cancellable: any Cancellable) {
        cancellables[uuid] = cancellable
    }
    func cancel(uuid: UUID) {
        print("cancel", cancellables[uuid] == nil ? "no cancellable" : "has cancellable")
        cancellables[uuid]?.cancel()
        remove(uuid: uuid)
    }
    func remove(uuid: UUID) {
        cancellables[uuid] = nil
    }
}

class FetchCancellation: Cancellable {
    let cancellation: () -> Void
    init(cancellation: @escaping () -> Void) {
        self.cancellation = cancellation
    }
    func cancel() {
        cancellation()
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
        let uuid: UUID = .init()
        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                if Task.isCancelled {
                    continuation.resume(throwing: CancellationError())
                    return
                }
                Task {
                    if Task.isCancelled {
                        continuation.resume(throwing: CancellationError())
                        return
                    }
                    let cancelable = fetch(query: query, cachePolicy: cachePolicy, contextIdentifier: contextIdentifier, context: context, queue: queue) {  result in
                        defer {
                            Task {
                                await CancelableHolder.shared.remove(uuid: uuid)
                            }
                        }
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
                    let fetchCancellation = FetchCancellation {
                        cancelable.cancel()
                        continuation.resume(throwing: CancellationError())
                    }
                    await CancelableHolder.shared.setCancellable(uuid: uuid, cancellable: fetchCancellation) // fetchがすぐにキャンセルした場合（例えば同期的にキャンセルしたりする場合）ここと
                }
            }
        } onCancel: {
            Task {
                await CancelableHolder.shared.cancel(uuid: uuid) // ここの順番が保証されない？
            }
        }
    }
}
