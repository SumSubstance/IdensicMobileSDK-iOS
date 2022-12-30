// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.22.0"

enum checksums {
    
    static let msdk = "10cbcc5a09a42953d532eb2d9c67de405a709e18fa609ab119e708ca66343c3e"
    static let mrtd = "f4f852f7b906cf0049ae86993655e368f527175c2740e6e5de165642f73b81bf"
    static let vi   = "230d604102a6236285f328576095e29fceec4484b2131b4ccb7bf88cd6396e9e"
    
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
