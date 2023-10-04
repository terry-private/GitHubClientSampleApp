import Foundation

public enum GraphQLError: Error {
    case convertFailure
    case unexpected
}

extension GraphQLError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .convertFailure: return "cannot translate"
        case .unexpected: return "unknown error"
        }
    }
}
