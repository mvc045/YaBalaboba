// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YaBalaboba",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "YaBalaboba",
            targets: ["YaBalaboba"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/realm/realm-swift",
            branch: "master"
        ),
        .package(
            url: "https://github.com/tristanhimmelman/ObjectMapper",
            branch: "master"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "YaBalaboba",
            dependencies: [
                .product(name: "ObjectMapper", package: "ObjectMapper"),
                .product(name: "RealmSwift", package: "realm-swift"),
            ]),
        .testTarget(
            name: "YaBalabobaTests",
            dependencies: ["YaBalaboba"]),
    ]
)
