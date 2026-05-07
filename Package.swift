// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = Version("1.44.0")

let gitUrl = "https://maven.sumsub.com/repository/releases/IdensicMobileSDK-iOS/\(version)"

enum checksums {
    static let msdk = "6e0bb5900312451699a064a9aff7229739ac2ee7965aecf2629fde3b65d260f9"
}

let package = Package(
    name: "IdensicMobileSDK",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "IdensicMobileSDK",
            targets: [
                "IdensicMobileSDK"
            ]
        )
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "IdensicMobileSDK",
            url: "\(gitUrl)/IdensicMobileSDK_Core-\(version).zip",
            checksum: checksums.msdk
        )
    ]
)
