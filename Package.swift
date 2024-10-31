// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.33.1"
let aalVersion = "1.3.3"

let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"
let depsUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/Deps"

enum checksums {

    static let msdk = "d20123b479e0033a167c6ddcabb98d1a382e08c1222e3f135ae74ff8b180bc1c"
    static let mrtd = "a8041182647aed274eeb0b1ffc2cc5be2ecfcbc2fc82c72ea56c1505747d4800"
    static let vi   = "28dcbc30fd245fabde02b794ad701427ec7e0e94cc66786b6e85d3dc6770b467"
    static let eid  = "088fe0516c34641c25c063167b5865f6ae2d47888f60c09f875b55092e50ca5b"
    static let aal  = "d7c970bd9109d6e4e4cd238e70eea0c312e7355c578f55af1a4db37a7374bfe0"

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
        ),
        .library(
            name: "IdensicMobileSDK_EID",
            targets: [
                "IdensicMobileSDK", "EIDWrapper"
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
        ),
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
        .binaryTarget(
            name: "IdensicMobileSDK_EID",
            url: "\(gitUrl)/IdensicMobileSDK_EID-\(version).zip",
            checksum: checksums.eid
        ),
        .binaryTarget(
            name: "AuthadaAuthenticationLibrary",
            url: "\(depsUrl)/AuthadaAuthenticationLibrary-\(aalVersion).zip",
            checksum: checksums.aal
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
        ),
        .target(
            name: "EIDWrapper",
            dependencies: [
                "IdensicMobileSDK_EID",
                "AuthadaAuthenticationLibrary"
            ],
            path: "EIDWrapper"
        )
    ]
)
