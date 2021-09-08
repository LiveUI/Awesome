// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Awesome",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "Awesome",
            targets: ["Awesome"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Awesome",
            dependencies: [],
            path: "Classes",
            resources: [
//                .copy("Assets"),
                .process("fa-solid-900.ttf"),
                .process("fa-brands-400.ttf"),
                .process("fa-regular-400.ttf"),
            ],
            swiftSettings: [
                .define("AwesomeSPM")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
