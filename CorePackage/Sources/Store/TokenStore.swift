import Foundation
import UserDefaultsClient

@MainActor
public class TokenStore {
    @Published public private(set) var token: String?
    public private(set) var refresh: () -> Void
    public private(set) var setToken: (String) -> Void
    
    private var client: UserDefaultsClient
    
    init(client: UserDefaultsClient) {
        self.client = client
        token = client.fetchToken()
        self.refresh = {}
        self.setToken = { _ in }
    }
}

// implements
extension TokenStore {
    // Clientは公開しない
    public static var forProduction: TokenStore = forProduction(.forProduction)
    
    // ClientをDIしてテストできる
    static func forProduction( _ client: UserDefaultsClient = .forProduction) -> TokenStore {
        let tokenStore = TokenStore(client: client)
        tokenStore.refresh = {
            tokenStore.token = nil
            tokenStore.client.removeToken()
        }
        tokenStore.setToken = { newToken in
            tokenStore.token = newToken
            tokenStore.client.updateToken(newToken)
        }
        return tokenStore
    }
}
