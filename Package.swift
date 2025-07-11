// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let url = "https://github.com/ridgelineinternational/wireguard-apple-xcframework/releases/download/0.0.1/WireGuardGoFoundation.xcframework.zip"
let checksum = "3d9faeaacf8908a7e2d18bd4a314b89192e0afa974522379436d2edf7cf0c80f"

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
