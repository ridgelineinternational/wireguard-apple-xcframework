// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let url = "https://github.com/ridgelineinternational/wireguard-apple-xcframework/releases/download/0.0.2/WireGuardGoFoundation.xcframework.zip"
let checksum = "f38defab96c3f2a5381f7a6cde3b4635c5da8378a254c65801b99fa3a6288020"

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(name: "WireGuardKit", targets: ["WireGuardKit"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WireGuardKit",
            dependencies: ["WireGuardGoFoundation", "WireGuardKitC"]
        ),
        .target(
            name: "WireGuardKitC",
            dependencies: [],
            publicHeadersPath: "."
        ),
        .binaryTarget(name: "WireGuardGoFoundation", url: url, checksum: checksum)
    ]
)
