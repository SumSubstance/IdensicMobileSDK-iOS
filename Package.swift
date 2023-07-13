// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.26.0"
let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"

enum checksums {
    
    static let msdk = "add4f1717cd6daddf098c49b9926b39d5e80934efd1347e6f50ba6826629350e"
    static let mrtd = "5e99cb426fd9cc99648ae816b787580ab99931179500740b1800b6bcc11e2747"
    static let vi   = "17d26dd8936c0d2d7133ff70e446f5d45c86f9ca66d31ac196cd5ff5343eb341"
    
}

let package = Package(
    name: "IdensicMobileSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "IdensicMobileSDK",
            targets: [
                "IdensicMobileSDK"
            ]
        ),
        .library(
            name: "IdensicMobileSDK_MRTDReader",
            targets: [
                "IdensicMobileSDK", "MRTDReaderWrapper"
            ]
        ),
        .library(
            name: "IdensicMobileSDK_VideoIdent",
            targets: [
                "IdensicMobileSDK", "VideoIdentWrapper"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/krzyzanowskim/OpenSSL",
            "1.0.0" ..< "2.0.0"
        ),
        .package(
            url: "https://github.com/twilio/twilio-video-ios",
            "4.0.0" ..< "5.0.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "IdensicMobileSDK",
            url: "\(gitUrl)/IdensicMobileSDK_Core-\(version).zip",
            checksum: checksums.msdk
        ),
        .binaryTarget(
            name: "IdensicMobileSDK_MRTDReader",
            url: "\(gitUrl)/IdensicMobileSDK_MRTDReader-\(version).zip",
            checksum: checksums.mrtd
        ),
        .binaryTarget(
            name: "IdensicMobileSDK_VideoIdent",
            url: "\(gitUrl)/IdensicMobileSDK_VideoIdent-\(version).zip",
            checksum: checksums.vi
        ),
        .target(
            name: "MRTDReaderWrapper",
            dependencies: [
                "IdensicMobileSDK_MRTDReader",
                "OpenSSL"
            ],
            path: "MRTDReaderWrapper"
        ),
        .target(
            name: "VideoIdentWrapper",
            dependencies: [
                "IdensicMobileSDK_VideoIdent",
                .product(name: "TwilioVideo", package: "twilio-video-ios")
            ],
            path: "VideoIdentWrapper"
        )
    ]
)
