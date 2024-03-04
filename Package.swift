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
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/5.5.6-beta.9/MeetingDoctorsCore.xcframework.zip",
            checksum: "39018c0e068fed63578e78e8813c4d6f2bb106de52770008d934200965b20866"
        ),
        // MARK: - MDSchema
        .binaryTarget(
            name: "MeetingDoctorsSchema",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/5.5.6-beta.9/MeetingDoctorsSchema.xcframework.zip",
            checksum: "222810b7ecd7fe824465d213a0f169f4957126e7acdf0f2338f87015f9308fc5"
        ),
        // MARK: - MDController
        .binaryTarget(
            name: "MeetingDoctorsController",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/5.5.6-beta.9/MeetingDoctorsController.xcframework.zip",
            checksum: "49acb84dd5564878007ce163faaa8ff2d30e9ba4600f3c227ac009f36814ff21"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSocket",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/5.5.6-beta.9/MeetingDoctorsSocket.xcframework.zip",
            checksum: "dfab6d49eecd1cd8d7b6a7b9fa56bbf29027533dd27fde55c3e28baa150b24c3"
        ),
        .binaryTarget(
            name: "MeetingDoctorsStorage",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/5.5.6-beta.9/MeetingDoctorsStorage.xcframework.zip",
            checksum: "794453e29d55b430dda394bbd3c890809dd40ebb6ba6a21ee1f7f72de971fae0"
        ),
        .binaryTarget(
            name: "MeetingDoctorsRemote",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/5.5.6-beta.9/MeetingDoctorsRemote.xcframework.zip",
            checksum: "43be88f99cf495e62ddb61fac18f027aa2e5eca51e554e346da5dc557f415824"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            url: "https://sdk-download-meetingdoctors.s3.eu-central-1.amazonaws.com/iOS/MeetingDoctorsSDK/test/5.5.6-beta.9/MeetingDoctorsSDK.xcframework.zip",
            checksum: "709dc658fe10621b3dfd1b1dbe2accd577cbeeec5b18b009c6efcfd480e9bcfa"
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
