// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.36.1"
let aalVersion = "1.3.4"

let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"
let depsUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/Deps"

enum checksums {

    static let msdk = "8ede7069f9b8b6b6b2e6517aeded3126c6e313bd03feb07b5b7905b64b9bffdd"
    static let mrtd = "8117bcb0db55a8e68beb277969cc4cd61fec3333c2a4952a8f58de12f13da905"
    static let vi   = "467ff4d4eeda809adc9f3a82b8151cdab730e54ed09f2a87ea90bf61931c1045"
    static let eid  = "dad0a9cf9d3a48b25e94094257185baf779874bbc63ad40d86b167662cabffa2"
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
