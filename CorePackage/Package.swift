// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private extension PackageDescription.Target.Dependency {
    static let apollo: Self = .product(name: "Apollo", package: "apollo-ios")
    static let apolloAPI: Self = .product(name: "ApolloAPI", package: "apollo-ios")
    static let apolloSQLite: Self = .product(name: "ApolloSQLite", package: "apollo-ios")
    static let nukeUI: Self = .product(name: "NukeUI", package: "Nuke")
    // Generated package
    static let generatedGraphQLModel: Self = .product(name: "GeneratedGraphQLModel", package: "GeneratedGraphQLModel")
}

let package = Package(
    name: "CorePackage",
    platforms: [
        .iOS("16.1")
    ],
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.5.0"),
        .package(url: "https://github.com/kean/Nuke.git", from: "12.1.0"),
        .package(path: "../GeneratedGraphQLModel")
    ],
    targets: [
        // MARK: AppFeature
        .target(
            name: "AppFeature",
            dependencies: ["Search"]),
        
        // MARK: Clients
        .target(
            name: "GraphQLClient",
            dependencies: [.apollo, .apolloAPI, .apolloSQLite, .generatedGraphQLModel, "Entity"],
            path: "./Sources/Clients/GraphQLClient"),
        .target(
            name: "UserDefaultsClient",
            dependencies: [],
            path: "./Sources/Clients/UserDefaultsClient"),
        
        .target(
            name: "Components",
            dependencies: []),
        
        .target(
            name: "Entity",
            dependencies: []),
        
        // MARK: Features
        .target(
            name: "Search",
            dependencies: [.nukeUI, "Components", "Entity", "GraphQLClient", "Store"],
            path: "./Sources/Features/Search"),
        
        .target(
            name: "Store",
            dependencies: ["Entity", "GraphQLClient", "UserDefaultsClient"]),
        
        // MARK: Test
        .testTarget(
            name: "CorePackageTests",
            dependencies: ["GraphQLClient"]),
    ]
)
