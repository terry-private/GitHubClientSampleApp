import Foundation
import Combine
import GraphQLClient
import Entity

@MainActor
public class SearchedRepositoriesStore {
    @Published public private(set) var searchedRepositories: [SearchedRepository] = []
    private let tokenStore: TokenStore
    private var client: GraphQLClient? = nil
    private var cancellables: Set<AnyCancellable> = []
    
    public var search: (String) async throws -> Void
    
    init(tokenStore: TokenStore) {
        self.tokenStore = tokenStore
        search = { _ in }
        
        tokenStore.$token
            .sink { [weak self] token in
                guard let token else { return }
                self?.client = GraphQLClient.forProduction(byToken: token)
            }
            .store(in: &cancellables)
    }
}

extension SearchedRepositoriesStore {
    public static var forProduction: SearchedRepositoriesStore = forProduction(tokenStore: .forProduction)
    
    static func forProduction(tokenStore: TokenStore) -> SearchedRepositoriesStore {
        let store = SearchedRepositoriesStore(tokenStore: tokenStore)
        store.search = { word in
            store.searchedRepositories = []
            guard let client = store.client else { return }
            store.searchedRepositories = try await client.searchRepositories(word)
        }
        return store
    }
}
