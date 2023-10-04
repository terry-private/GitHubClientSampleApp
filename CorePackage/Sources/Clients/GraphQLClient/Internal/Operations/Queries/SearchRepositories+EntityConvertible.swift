import Foundation
import Entity
import GeneratedGraphQLModel

extension SearchRepositoriesQuery.Data: EntityConvertible {
    func convertedToEntity() throws -> [SearchedRepository] {
        guard let edges = self.search.edges else {
            throw GraphQLError.convertFailure
        }
        var repositories: [SearchedRepository] = []
        for edge in edges {
            do {
                guard let repository = try edge?.node?.asRepository?.convertedToEntity()  else {
                    throw GraphQLError.convertFailure
                }
                repositories.append(repository)
            } catch {
                throw error
            }
        }
        return repositories
    }
}

extension SearchRepositoriesQuery.Data.Search.Edge.Node.AsRepository: EntityConvertible {
    func convertedToEntity() throws -> SearchedRepository {
        return SearchedRepository(
            id: SearchedRepository.ID(rawValue: id),
            name: name,
            description: description,
            stargazerCount: stargazerCount,
            owner: try owner.convertedToEntity(),
            primaryLanguage: try primaryLanguage?.convertedToEntity()
        )
    }
}

extension SearchRepositoriesQuery.Data.Search.Edge.Node.AsRepository.Owner: EntityConvertible {
    func convertedToEntity() throws -> Owner {
        if let organization = asOrganization {
            return Owner(
                id: Owner.ID(rawValue: organization.id),
                avatarURL: URL(string: organization.avatarUrl),
                name: organization.name
            )
        }
        if let user = asUser {
            return Owner(
                id: Owner.ID(rawValue: user.id),
                avatarURL: URL(string: user.avatarUrl),
                name: user.name
            )
        }
        throw GraphQLError.convertFailure
    }
}

extension SearchRepositoriesQuery.Data.Search.Edge.Node.AsRepository.PrimaryLanguage: EntityConvertible {
    func convertedToEntity() throws -> Language {
        Language(id: Language.ID(rawValue: id), name: name, color: color)
    }
}
