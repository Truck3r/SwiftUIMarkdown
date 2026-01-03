// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftUIMarkdown",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "SwiftUIMarkdown",
            targets: ["SwiftUIMarkdown"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-markdown", from: "0.7.3")
    ],
    targets: [
        .target(
            name: "SwiftUIMarkdown",
            dependencies: [
                .product(name: "Markdown", package: "swift-markdown")
            ]
        ),
        .testTarget(
            name: "SwiftUIMarkdownTests",
            dependencies: ["SwiftUIMarkdown"],
            resources: [
                .process("TestResources")
            ]
        )
    ]
)
