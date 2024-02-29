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
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0"),
        .package(url: "https://github.com/socketio/socket.io-client-swift.git", from: "15.2.0"),
        .package(url: "https://github.com/realm/realm-swift.git", from: "10.17.0"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.3.0"),
        .package(url: "https://github.com/opentok/vonage-client-sdk-video", from: "2.26.0"),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        // MARK: - MDCore
        .binaryTarget(
            name: "MeetingDoctorsCore",
            path: "Frameworks/MeetingDoctorsCore.xcframework"
        ),
        // MARK: - MDSchema
        .binaryTarget(
            name: "MeetingDoctorsSchema",
            path: "Frameworks/MeetingDoctorsSchema.xcframework"
        ),
        // MARK: - MDController
        .binaryTarget(
            name: "MeetingDoctorsController",
            path: "Frameworks/MeetingDoctorsController.xcframework"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSocket",
            path: "Frameworks/MeetingDoctorsSocket.xcframework"
        ),
        .binaryTarget(
            name: "MeetingDoctorsStorage",
            path: "Frameworks/MeetingDoctorsStorage.xcframework"
        ),
        .binaryTarget(
            name: "MeetingDoctorsRemote",
            path: "Frameworks/MeetingDoctorsRemote.xcframework"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            path: "Frameworks/MeetingDoctorsSDK.xcframework"
        ),
        .target(
            name: "MeetingDoctorsSDKWrapper",
            dependencies: [
                "MeetingDoctorsCore",
                "MeetingDoctorsSchema",
                "MeetingDoctorsController",
                "MeetingDoctorsSocket",
                "MeetingDoctorsStorage",
                "MeetingDoctorsRemote",
                "MeetingDoctorsSDK",
                // Agrega aquí más dependencias si son necesarias.
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                .product(name: "Realm", package: "realm-swift"),
                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "Lottie", package: "lottie-spm"),
                .product(name: "VonageClientSDKVideo", package: "vonage-client-sdk-video"),
            ],
            path: "Sources/MeetingDoctorsSDKWrapper"
        ),
    ]
)
