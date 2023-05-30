// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
// https://forums.swift.org/t/xcframework-dependencies-is-implemented-in-both-issue/59220
import PackageDescription

let package = Package(
    name: "MeetingDoctorsSDK",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "MeetingDoctorsSDK",
            targets: [
                "MeetingDoctorsCore",
                "MeetingDoctorsSchema",
                "MeetingDoctorsController",
                "MeetingDoctorsSocket",
                "MeetingDoctorsRemote",
                "MeetingDoctorsSDK",
            ]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "MeetingDoctorsCore",
            path: "Frameworks/MeetingDoctorsCore.xcframework"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSchema",
            path: "Frameworks/MeetingDoctorsSchema.xcframework"
        ),
        .binaryTarget(
            name: "MeetingDoctorsController",
            path: "Frameworks/MeetingDoctorsController.xcframework"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSocket",
            path: "Frameworks/MeetingDoctorsSocket.xcframework"
        ),
        .binaryTarget(
            name: "MeetingDoctorsRemote",
            path: "Frameworks/MeetingDoctorsRemote.xcframework"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            path: "Frameworks/MeetingDoctorsSDK.xcframework"
        ),
    ]
)
