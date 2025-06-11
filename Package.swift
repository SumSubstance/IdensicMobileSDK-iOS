// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.36.0"
let aalVersion = "1.3.4"

let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"
let depsUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/Deps"

enum checksums {

    static let msdk = "2b3969afd43f39a2f891cad88087048a72c72a7fb5f0f893ab15a45307eb7f94"
    static let mrtd = "f22373fdc2c83853b2cb40459f214f647fa34a319cd0960fc305e36825cd15e8"
    static let vi   = "0e7377a89e131b822e1ee1a0121d8ba4b59acb4153286342ae2e8989c122758d"
    static let eid  = "eaead40b288fc9a36c2a07ab8b37908bcafd0430998582047ad393eb0d3129c8"
    static let aal  = "cc1105ec5143518465839cdecf67e7d776ed82a845e24b37bfba705a5d1850ce"

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
