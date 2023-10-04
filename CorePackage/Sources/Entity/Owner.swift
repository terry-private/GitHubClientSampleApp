import Foundation

public struct Owner: Identifiable, Equatable {
    public struct ID: RawRepresentable, Hashable, Codable {
        public var rawValue: String
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
    public var id: ID
    public var avatarURL: URL?
    public var name: String?
    
    public init(id: ID, avatarURL: URL? = nil, name: String? = nil) {
        self.id = id
        self.avatarURL = avatarURL
        self.name = name
    }
}

public extension Owner {
    static var forPreview: Owner = .init(id: ID(rawValue: ""), avatarURL: .init(string: "https://avatars.githubusercontent.com/u/10639145?s=48&v=4"), name: "sample owner")
}
