// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.33.0"
let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"

enum checksums {

    static let msdk = "2114352d564c26ae6c3834878e9583b3d6347043eca9b52925c7c53faa953833"
    static let mrtd = "ef58294c352982ea35801dbadbef0ccce6d20bbaca0aac810adfc9d80f122897"
    static let vi   = "7d3f4be12f803bc686604500ea707a979636593b0fea8023b67fdd2d828e9867"

}

let package = Package(
    name: "IdensicMobileSDK",
    platforms: [
        .iOS("12.2")
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
            "3.1.5001" ..< "4.0.0"
        ),
        .package(
            url: "https://github.com/twilio/twilio-video-ios",
            "5.8.2" ..< "6.0.0"
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
