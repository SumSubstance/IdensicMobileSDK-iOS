// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.21.0"

enum checksums {
    
    static let msdk = "7fa86f2a1b61a40bfe63967740cd88b39ae9bbfbe409c9c398c7504d7cd3b99e"
    static let mrtd = "c8460b340d19e49368d3fa651d2ff6c4b3055ee33f342c4cf22a2eb8326d91bb"
    static let vi   = "35df472fa082d581ec4675abdb1f7ee5d9e7636b8677691df5dda0322eb483c9"
    
}

let package = Package(
    name: "IdensicMobileSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "IdensicMobileSDK",
            targets: ["IdensicMobileSDK"]
        ),
        .library(
            name: "IdensicMobileSDK_MRTDReader",
            targets: ["IdensicMobileSDK", "MRTDReaderWrapper"]
        ),
        .library(
            name: "IdensicMobileSDK_VideoIdent",
            targets: ["IdensicMobileSDK", "VideoIdentWrapper"]
        )
    ],
    dependencies: [
        .package(
            name: "OpenSSL",
            url: "https://github.com/krzyzanowskim/OpenSSL.git",
            "1.0.0" ..< "2.0.0"
        ),
        .package(
            name: "TwilioVideo",
            url: "https://github.com/twilio/twilio-video-ios.git",
            "4.0.0" ..< "6.0.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "IdensicMobileSDK",
            url: "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)/IdensicMobileSDK-\(version).zip",
            checksum: checksums.msdk
        ),
        .binaryTarget(
            name: "IdensicMobileSDK_MRTDReader",
            url: "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)/IdensicMobileSDK_MRTDReader-\(version).zip",
            checksum: checksums.mrtd
        ),
        .binaryTarget(
            name: "IdensicMobileSDK_VideoIdent",
            url: "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)/IdensicMobileSDK_VideoIdent-\(version).zip",
            checksum: checksums.vi
        ),
        .target(
            name: "MRTDReaderWrapper",
            dependencies: ["IdensicMobileSDK_MRTDReader", "OpenSSL"],
            path: "MRTDReaderWrapper"
        ),
        .target(
            name: "VideoIdentWrapper",
            dependencies: ["IdensicMobileSDK_VideoIdent", "TwilioVideo"],
            path: "VideoIdentWrapper"
        )
    ]
)
