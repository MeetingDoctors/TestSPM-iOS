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
            url:
                "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/5.5.6-beta.18/MeetingDoctorsCore.xcframework.zip",
            checksum: "fba851fa517c16d4b977dce5b7f4b3fb66ae3960743e864eb3ea4e74adb3e992"
        ),
        // MARK: - MDSchema
        .binaryTarget(
            name: "MeetingDoctorsSchema",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/5.5.6-beta.18/MeetingDoctorsSchema.xcframework.zip",
            checksum: "a6a4d830107fab4bebe5f06f729650b5bec230992a7a0f7dda7a433327941e69"
        ),
        // MARK: - MDController
        .binaryTarget(
            name: "MeetingDoctorsController",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/5.5.6-beta.18/MeetingDoctorsController.xcframework.zip",
            checksum: "511635b5ddc5ea5e840711251a6eb0643a8dc8fffa01703e5b0fcf9db95834f5"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSocket",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/5.5.6-beta.18/MeetingDoctorsSocket.xcframework.zip",
            checksum: "96a4d9f94660d8534eed78c0f5f398fdb23cd96e1bce3f4e0dfef8abca37bf58"
        ),
        .binaryTarget(
            name: "MeetingDoctorsStorage",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/5.5.6-beta.18/MeetingDoctorsStorage.xcframework.zip",
            checksum: "f1e6d293a4b4fb3a8453a29e9cc9c0bf5c85b9090bd4fe6cbabb4529bc2221a8"
        ),
        .binaryTarget(
            name: "MeetingDoctorsRemote",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/5.5.6-beta.18/MeetingDoctorsRemote.xcframework.zip",
            checksum: "a2e99eb0be7e06a7f68af2455c5fbacbf758a48c3db833ce080e3f1ec120f3b9"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/5.5.6-beta.18/MeetingDoctorsSDK.xcframework.zip",
            checksum: "1f7bee8650ac3a981b0a3917c7e5cbbc2ac6e7729b7a030dbbfd5dc1c2e97f78"
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
