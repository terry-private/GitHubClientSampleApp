import Foundation

public struct Language: Identifiable, Equatable {
    public struct ID: RawRepresentable, Hashable, Codable {
        public var rawValue: String
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
    public var id: ID
    public var name: String
    public var color: String?
    
    public init(id: ID, name: String, color: String? = nil) {
        self.id = id
        self.name = name
        self.color = color
    }
}

public extension Language {
    static var forPreview: Language = .init(id: .init(rawValue: ""), name: "sample language", color: "#f3f3aa")
}
