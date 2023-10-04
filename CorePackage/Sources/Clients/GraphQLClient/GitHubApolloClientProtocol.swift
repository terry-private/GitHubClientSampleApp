import Foundation
import ApolloSQLite
import Apollo


public protocol GitHubApolloClientProtocol: ApolloClientProtocol, TokenInitializable {}

extension GitHubApolloClientProtocol {
    static var baseURL: URL { .init(string: "https://api.github.com/graphql")! }
}

extension ApolloClient: GitHubApolloClientProtocol {
    public static func make(by token: String) -> Self {
        let documentsPath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true
        ).first!
        let documentsURL = URL(fileURLWithPath: documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent("apollo_db.sqlite")
        let sqliteCache = try! SQLiteNormalizedCache(fileURL: sqliteFileURL)
        let store = ApolloStore(cache: sqliteCache)
        let client = URLSessionClient()
        let provider = DefaultInterceptorProvider(client: client, store: store)
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: Self.baseURL,
            additionalHeaders: ["Authorization": "Bearer \(token)"]
        )
        return ApolloClient(networkTransport: transport, store: store) as! Self
    }
}
