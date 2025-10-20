// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.35.0"
let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"

enum checksums {

    static let msdk = "962e3d5a3e9fde75cc7c128c3d29271f1d0fa3521be24f4c2fc73279afbd9e60"
    static let mrtd = "00a675e13041bc8a90aa484eff88c5fd1cbc07d946713e40f4f3be0011567c1b"
    static let vi   = "5052eaed375bb5120793276a29240bc07ce3590c634895862c887cc0e5535afa"

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
