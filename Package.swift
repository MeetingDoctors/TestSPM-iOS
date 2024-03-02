// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeetingDoctorsSDK",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MeetingDoctorsSDKWrapper",
            targets: ["MeetingDoctorsSDKWrapper"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "6.5.0"),
        .package(url: "https://github.com/socketio/socket.io-client-swift.git", exact: "15.2.0"),
//        .package(url: "https://github.com/realm/realm-swift.git", from: "10.47.0"),
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.3.0"),
        .package(url: "https://github.com/opentok/vonage-client-sdk-video", from: "2.27.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        // MARK: - MDCore
        .binaryTarget(
            name: "MeetingDoctorsCore",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/MeetingDoctorsCore.xcframework.zip",
            checksum: "72be1441a76fb13d06620e583a69b4fb8c53d691c212dc56bc65d386db917d85"
        ),
        // MARK: - MDSchema
        .binaryTarget(
            name: "MeetingDoctorsSchema",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/MeetingDoctorsSchema.xcframework.zip",
            checksum: "f8b620d6ea978ec07809f5e71faf4d16f096667b52700840fcd97362484a7087"
        ),
        // MARK: - MDController
        .binaryTarget(
            name: "MeetingDoctorsController",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/MeetingDoctorsController.xcframework.zip",
            checksum: "5425bb1d8ed18383ddc65e392e765ef7cfcbb960e92fdf7c29b03b2370171fa9"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSocket",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/MeetingDoctorsSocket.xcframework.zip",
            checksum: "0f592bd1e4ad89edb654ce4846f162e51c576727b63a78467f0ad901c7c7ebe1"
        ),
        .binaryTarget(
            name: "MeetingDoctorsStorage",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/MeetingDoctorsStorage.xcframework.zip",
            checksum: "94e0cbc7bcc34620c3cd08ff56e93fb307e4db0dcac3bacda653dc2d48c9d48f"
        ),
        .binaryTarget(
            name: "MeetingDoctorsRemote",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/MeetingDoctorsRemote.xcframework.zip",
            checksum: "8f5d940b12547b975dea86c03574c14d64da9ac4d969408858f4646b6592b6f3"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/MeetingDoctorsSDK.xcframework.zip",
            checksum: "51a870af56a7b95f34ebdda2566c97e6d5d03c23ae2f22686d5b4d4085a069f5"
        ),
        .binaryTarget(
            name: "Realm",
            path: "Frameworks/Realm.xcframework"
        ),
        .binaryTarget(
            name: "RealmSwift",
            path: "Frameworks/RealmSwift.xcframework"
        ),
        .target(
            name: "MeetingDoctorsSDKWrapper",
            dependencies: [
                "MeetingDoctorsCore",
                "MeetingDoctorsSchema",
                "MeetingDoctorsController",
                "MeetingDoctorsSocket",
                "Realm",
                "RealmSwift",
                "MeetingDoctorsStorage",
                "MeetingDoctorsRemote",
                "MeetingDoctorsSDK",
                // Agrega aquí más dependencias si son necesarias.
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "SocketIO", package: "socket.io-client-swift"),
//                .product(name: "Realm", package: "realm-swift"),
//                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "VonageClientSDKVideo", package: "vonage-client-sdk-video"),
            ],
            path: "Sources/MeetingDoctorsSDKWrapper"
        ),
    ]
)
