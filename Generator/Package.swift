// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Generator",
    platforms: [.macOS(.v10_13)],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup", from: "2.3.8"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.5.0"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.0"),
        .package(url: "https://github.com/JohnSundell/Files", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "Generator",
            dependencies: [.product(name: "SwiftSoup", package: "SwiftSoup"),
                           .product(name: "Alamofire", package: "Alamofire"),
                           .product(name: "SwiftyJSON", package: "SwiftyJSON"),
                           .product(name: "Files", package: "Files"),
                           .product(name: "ArgumentParser", package: "swift-argument-parser")]),
    ]
)
