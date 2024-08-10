// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "McBarSilDesignSystem",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "McBarSilDesignSystem", targets: ["McBarSilDesignSystem"]),
    ],
    targets: [
        .target(
            name: "McBarSilDesignSystem",
            dependencies: [],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "McBarSilDesignSystemTests",
            dependencies: ["McBarSilDesignSystem"]),
    ]
)
