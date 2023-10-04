import Foundation

public struct SearchedRepository: Identifiable, Equatable {
    public struct ID: RawRepresentable, Hashable, Codable {
        public var rawValue: String
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
    public var id: ID
    public var name: String
    public var description: String?
    public var stargazerCount: Int
    public var owner: Owner
    public var primaryLanguage: Language?
    
    public init(id: ID, name: String, description: String?, stargazerCount: Int, owner: Owner, primaryLanguage: Language?) {
        self.id = id
        self.name = name
        self.description = description
        self.stargazerCount = stargazerCount
        self.owner = owner
        self.primaryLanguage = primaryLanguage
    }
}

public extension SearchedRepository {
    static var forPreview: SearchedRepository = .init(id: .init(rawValue: ""), name: "sample repository", description: "sample description", stargazerCount: 600, owner: .forPreview, primaryLanguage: .forPreview)
}
