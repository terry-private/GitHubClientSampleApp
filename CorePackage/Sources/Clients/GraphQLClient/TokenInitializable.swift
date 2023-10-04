import Foundation

public protocol TokenInitializable {
    static func make(by token: String) -> Self
}
