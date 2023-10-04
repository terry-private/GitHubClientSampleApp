import Foundation
import Combine
import Entity
import GraphQLClient
import Store

@MainActor
class SearchViewState: ObservableObject {
    @Published private(set) var isShowInputTokenView: Bool = false
    @Published private(set) var repositories: [SearchedRepository] = []
    @Published private(set) var isFetching: Bool = false
    @Published var inputToken: String
    @Published var searchWord: String = "swift"
    
    var searchTask: Task<Void, Error>?
    
    private let tokenStore: TokenStore
    private let searchRepositoriesStore: SearchedRepositoriesStore
    private var cancellables: Set<AnyCancellable> = []
    
    init(tokenStore: TokenStore, searchRepositoriesStore: SearchedRepositoriesStore) {
        self.tokenStore = tokenStore
        self.searchRepositoriesStore = searchRepositoriesStore
        let token = tokenStore.token ?? ""
        inputToken = token
        
        tokenStore.$token
            .sink { [weak self] token in
                self?.isShowInputTokenView = token == nil
            }
            .store(in: &cancellables)
        
        searchRepositoriesStore.$searchedRepositories
            .sink { [weak self] searchedRepositories in
                self?.repositories = searchedRepositories
            }
            .store(in: &cancellables)
    }
    
    func tokenSetButtonTapped() {
        tokenStore.setToken(inputToken)
    }
    
    func searchButtonTapped() {
        searchTask = Task {
            do {
                isFetching = true
                try await searchRepositoriesStore.search(searchWord)
                isFetching = false
                searchTask = nil
            } catch {
                isFetching = false
                searchTask = nil
            }
        }
    }
    
    func cancel() {
        searchTask?.cancel()
        isFetching = false
    }
}
