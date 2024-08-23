// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "vc-verifier",
    platforms: [.macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "vc-verifier",
            targets: ["vc-verifier"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airsidemobile/JOSESwift.git", .upToNextMajor(from: "2.4.0")),
        .package(url: "https://github.com/TakeScoop/SwiftyRSA.git", .upToNextMajor(from: "1.8.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "vc-verifier",
            dependencies: ["JOSESwift", "SwiftyRSA"]
        ),
        .testTarget(
            name: "vc-verifierTests",
            dependencies: ["vc-verifier"]),
    ]
)
