import Foundation
import Apollo
import ApolloAPI
import ApolloSQLite
import Entity
import GeneratedGraphQLModel

public class GraphQLClient {
    private var apollo: any GitHubApolloClientProtocol
    
    public var searchRepositories: (String) async throws -> [SearchedRepository]
    
    init(token: String, apolloType: GitHubApolloClientProtocol.Type = ApolloClient.self) {
        apollo = apolloType.make(by: token)
        searchRepositories = { _ in []}
    }
}

public extension GraphQLClient {
    static func forProduction(byToken: String) -> GraphQLClient {
        let client = GraphQLClient(token: byToken)
        
        client.searchRepositories = { word in
            let query = SearchRepositoriesQuery(query: .init(word), after: nil)
            return try await client.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely)
        }
        
        return client
    }
}

