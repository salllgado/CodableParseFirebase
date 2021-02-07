// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodableParseFirebase",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v10),
        .watchOS(.v5),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "CodableParseFirebase",
            targets: ["CodableParseFirebase"]),
    ],
    targets: [
        .target(
            name: "CodableParseFirebase",
            dependencies: []),
        .testTarget(
            name: "CodableParseFirebaseTests",
            dependencies: ["CodableParseFirebase"]),
    ]
)
