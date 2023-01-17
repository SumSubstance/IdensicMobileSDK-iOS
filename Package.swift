// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.22.1"

enum checksums {
    
    static let msdk = "5d1ba6dd43ae1b1b182203c0c9c00912a847f0cf817f0704650af5f149251998"
    static let mrtd = "fbdaa342e78d7ce4c4c0fd5c7cdda6bd87c6e314f436c0421b75b22206498925"
    static let vi   = "efdff0a5152bd6d0f2ca6a68fd10ee1cab29c6720ea9e425ce8e60224ab2c46d"
    
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
