// swift-tools-version:4.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swiftymocky",
    products: [
        // XCTest Runtime libraries
        .library(name: "SwiftyMocky", targets: ["SwiftyMocky"]),
        .library(name: "SwiftyPrototype", targets: ["SwiftyPrototype"]),
        // CLI Executable
        .executable(name: "swiftymocky", targets: ["SwiftyMockyCLI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.3.0"),
        .package(url: "https://github.com/tuist/xcodeproj.git", from: "8.3.1"),
        .package(url: "https://github.com/luoxiu/Chalk", .exact("0.0.7")),
        .package(url: "https://github.com/kylef/Commander", .exact("0.9.1")),
        .package(url: "https://github.com/kylef/PathKit", from: "1.0.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "3.0.1"),
    ],
    targets: [
        // XCTest Runtime libraries
        .target(
            name: "SwiftyMocky",
            exclude: ["Mock.swifttemplate"]
        ),
        .target(
            name: "SwiftyPrototype",
            exclude: ["Prototype.swifttemplate"]
        ),
        .target(
            name: "Shared"
        ),
        .target(
            name: "Mocky_Example_macOS",
            path: "./SwiftyMocky-Example/Shared"
        ),
        .testTarget(
            name: "SwiftyMockyTests",
            dependencies: ["Mocky_Example_macOS", "SwiftyMocky"]
        ),
        // CLI Executable
        .target(
           name: "SwiftyMockyCLI",
           dependencies: [
               "Commander",
               "SwiftyMockyCLICore",
           ]
        ),
        .target(
           name: "SwiftyMockyCLICore",
           dependencies: [
               "ShellOut",
               "Chalk",
               "XcodeProj",
               "PathKit",
               "Yams",
           ]
        ),
    ]
)
