// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.18.2"
let checksum = "8b04fcadbdac88ad0a57266e63c77346e7530efbdb00c7c2a56ed4b9c0fe4b8e"

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
            url: "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)/IdensicMobileSDK-\(version)-xcode-12.zip",
            checksum: checksum
        )
    ]
)
