protocol EntityConvertible {
    associatedtype Entity
    func convertedToEntity() throws -> Entity
}
