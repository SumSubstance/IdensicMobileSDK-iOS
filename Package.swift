// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.27.0"
let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"

enum checksums {
    
    static let msdk = "d19714cfb6c4e2a42210609d7df6f8a4c2fdaba1fb37adfe709c1e4947b6e418"
    static let mrtd = "1833fde6a24c53fe7aefd6c050836e1882f4d28f2838c0f84d5b942be6c97ae9"
    static let vi   = "e529035f025dbb8b19df5af73353d1f5100b391bd5f23893d6f71418a4588a21"
    
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
