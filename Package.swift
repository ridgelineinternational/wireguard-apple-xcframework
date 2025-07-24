// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let url = "https://github.com/ridgelineinternational/wireguard-apple-xcframework/releases/download/0.0.4-test/WireGuardGoFoundation.xcframework.zip"
let checksum = "71a98ca9807756b007f7c8a31bce2618a7f5ff1c43569c8106cfb365a8d5582b"

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
