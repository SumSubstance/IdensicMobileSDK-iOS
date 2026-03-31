// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = Version("1.42.0")

let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"

enum checksums {
    static let msdk = "04c700b67a9917ec1c93d11643597862c1daf6f307bfaf7ba9565574e9015fd1"
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
