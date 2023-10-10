import Foundation
import Apollo
import ApolloAPI

private var cancellable: [UUID: Cancellable] = [:]

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
                cancellable[uuid] = fetch(query: query, cachePolicy: cachePolicy, contextIdentifier: contextIdentifier, context: context, queue: queue) {  result in
                    defer {
                        cancellable[uuid] = nil
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
            }
        } onCancel: {
            cancellable[uuid]?.cancel()
            cancellable[uuid] = nil
        }
    }
}
