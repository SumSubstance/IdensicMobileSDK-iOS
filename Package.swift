// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.19.4"
let checksum = "39b52dd23a853f70e2ead2f054bef4fb0311f6b21ba85c305be95403b647d885"

let package = Package(
    name: "IdensicMobileSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "IdensicMobileSDK",
            targets: ["IdensicMobileSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "IdensicMobileSDK",
            url: "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)/IdensicMobileSDK-\(version).zip",
            checksum: checksum
        )
    ]
)
