// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Generator",
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup", from: "1.7.0"),
	.package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "Generator",
            dependencies: ["SwiftSoup", "Alamofire"]),
    ]
)
