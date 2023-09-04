// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HelloAutomation",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HelloAutomation",
            targets: ["HelloAutomation"]),
        .library(name: "Helper", targets: ["Helper"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HelloAutomation"),
        .target(name: "Helper"),
        .testTarget(
            name: "HelloAutomationTests",
            dependencies: ["HelloAutomation"]),
        .testTarget(
            name: "HelperTests",
            dependencies: ["Helper"])
    ]
)
