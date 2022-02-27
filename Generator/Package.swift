// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Generator",
    platforms: [.macOS(.v10_12)],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup", from: "2.3.8"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.5.0"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "Generator",
            dependencies: ["SwiftSoup", "Alamofire", "SwiftyJSON"]),
    ]
)
