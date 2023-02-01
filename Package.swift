// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.23.0"

enum checksums {
    
    static let msdk = "c9cc7d395b7afd43a6223b629e2a506c4f843f07468fdbf1eefd46c498aa0a10"
    static let mrtd = "a89a98aad71c70f56c9b750d8fb6b0297a165e42e1fb8b75c07b121f9260b9db"
    static let vi   = "c6fbff3782e9e41b23f2e326a899f45b784320d4990d907e93f8c9dc945bcb7a"
    
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
