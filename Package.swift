// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.23.1"

enum checksums {
    
    static let msdk = "6f72c2dc9bc440ce8cef97de194698a2d1c372e4ac14c1e4c17aaaf9699b5380"
    static let mrtd = "25ff4eba080740e370fee4f5922787947d3c36a8e10000e9d7507e35e3ccec62"
    static let vi   = "493df48a57af3e1fe094d303d9fb6df5cde5661af8534c19072359d7c3162045"
    
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
