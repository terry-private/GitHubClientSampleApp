import Foundation
import Apollo
import ApolloAPI

extension ApolloClientProtocol {
    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        contextIdentifier: UUID? = nil,
        context: RequestContext? = nil,
        queue: DispatchQueue = .global(qos: .background)
    ) async throws -> Query.Data.Entity where Query.Data: EntityConvertible {
        let data = try await ApolloCancellableFetcher(apollo: self).fetch(
            query: query,
            cachePolicy: cachePolicy,
            contextIdentifier: contextIdentifier,
            context: context,
            queue: queue
        )
        do {
            return try data.convertedToEntity()
        } catch {
            throw GraphQLError.convertFailure
        }
    }
}

private actor ApolloCancellableFetcher<Client: ApolloClientProtocol> {
    private let apollo: Client
    private var canceling: (() -> Void)?
    
    init(apollo: Client) {
        self.apollo = apollo
    }
    
    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        contextIdentifier: UUID? = nil,
        context: RequestContext? = nil,
        queue: DispatchQueue = .global(qos: .background)
    ) async throws -> Query.Data {
        try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                // ここに辿り着くまでにキャンセルされている可能性を考慮
                if Task.isCancelled {
                    continuation.resume(throwing: CancellationError())
                    return
                }
                let apolloCasncellable = apollo.fetch(query: query, cachePolicy: cachePolicy, contextIdentifier: contextIdentifier, context: context, queue: queue) {  result in
                    switch result {
                    case .success(let graphQLResult):
                        guard let data = graphQLResult.data else {
                            continuation.resume(throwing: GraphQLError.unexpected)
                            return
                        }
                        continuation.resume(returning: data)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
                // ApolloClientのcancelだけだとcontinuationがリークするので、ちゃんとerrorをthrowする
                canceling = {
                    apolloCasncellable.cancel()
                    continuation.resume(throwing: CancellationError())
                }
            }
        } onCancel: {
            Task {
                await canceling?()
            }
        }
    }
}
