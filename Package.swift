// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeetingDoctorsEmmaSDK",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MeetingDoctorsEmmaSDK",
            targets: [
                "MeetingDoctorsEmmaSDKTargets",
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/EMMADevelopment/eMMa-iOS-SDK.git", from: "4.11.4")
    ],
    targets: [
        .binaryTarget(
            name: "MeetingDoctorsEmmaSDK",
            path: "Frameworks/MeetingDoctorsEmmaSDK.xcframework"
        ),
        .target(name: "MeetingDoctorsEmmaSDKTargets",
                dependencies: [
                    .target(name: "MeetingDoctorsEmmaSDK"),
                    .product(name: "EMMA_iOS",
                             package: "eMMa-iOS-SDK")
                ],
                path: "Sources"
        )
    ]
)
