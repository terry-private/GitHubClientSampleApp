import Foundation

public struct UserDefaultsClient {
    public var fetchToken: () -> String?
    public var updateToken: (String) -> Void
    public var removeToken: () -> Void
}

extension UserDefaultsClient {
    static let tokenKey: String = "token"
}

// implements
public extension UserDefaultsClient {
    static var forProduction = {
        let userDefaults = UserDefaults.standard
        return UserDefaultsClient {
            userDefaults.string(forKey: UserDefaultsClient.tokenKey)
        } updateToken: { token in
            userDefaults.set(token, forKey: UserDefaultsClient.tokenKey)
        } removeToken: {
            userDefaults.removeObject(forKey: UserDefaultsClient.tokenKey)
        }
    }()
}
