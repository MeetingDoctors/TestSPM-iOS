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
            name: "MeetingDoctorsSDK",
            targets: [
                "MeetingDoctorsCoreTargets",
                "MeetingDoctorsSchemaTargets",
                "MeetingDoctorsSocketTargets",
                "MeetingDoctorsRemoteTargets",
                "MeetingDoctorsStorageTargets",
                "MeetingDoctorsControllerTargets",
                "MeetingDoctorsSDKTargets",
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git",
                 from: "1.6.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git",
                 from: "10.8.0"),
        .package(url: "https://github.com/socketio/socket.io-client-swift",
                 from: "15.2.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git",
                 .upToNextMajor(from: "4.8.0")),
        .package(url: "https://github.com/realm/realm-swift.git",
                 from: "10.17.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git",
                 from: "6.5.0"),
        .package(url: "https://github.com/Swinject/Swinject.git",
                 from: "2.6.0"),
        .package(url: "https://github.com/Swinject/SwinjectStoryboard.git",
                 from: "2.2.0"),
        .package(url: "https://github.com/MattKiazyk/OpenTok.git",
                 from: "2.24.2"),
        .package(url: "https://github.com/airbnb/lottie-spm.git",
                 from: "4.1.2")
    ],
    targets: [
        .binaryTarget(
            name: "MeetingDoctorsCore",
            path: "Frameworks/MeetingDoctorsCore.xcframework"
        ),
        .target(name: "MeetingDoctorsCoreTargets",
                dependencies: [
                    .target(name: "MeetingDoctorsCore"),
                    .product(name: "CryptoSwift",
                             package: "CryptoSwift"),
                    .product(name: "FirebaseAnalyticsSwift",
                             package: "firebase-ios-sdk")
                ],
                path: "Sources/MDCore"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSchema",
            path: "Frameworks/MeetingDoctorsSchema.xcframework"
        ),
        .target(name: "MeetingDoctorsSchemaTargets",
                dependencies: [
                    .target(name: "MeetingDoctorsCore"),
                ],
                path: "Sources/MDSchema"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSocket",
            path: "Frameworks/MeetingDoctorsSocket.xcframework"
        ),
        .target(name: "MeetingDoctorsSocketTargets",
                dependencies: [
                    .target(name: "MeetingDoctorsSchema"),
                    .target(name: "MeetingDoctorsCore"),
                    .target(name: "MeetingDoctorsController"),
                    .product(name: "SocketIO",
                             package: "socket.io-client-swift")
                ],
                path: "Sources/MDSocket"
        ),
        .binaryTarget(
            name: "MeetingDoctorsRemote",
            path: "Frameworks/MeetingDoctorsRemote.xcframework"
        ),
        .target(name: "MeetingDoctorsRemoteTargets",
                dependencies: [
                    .target(name: "MeetingDoctorsSchema"),
                    .target(name: "MeetingDoctorsCore"),
                    .target(name: "MeetingDoctorsController"),
                    .product(name: "Alamofire",
                             package: "Alamofire")
                ],
                path: "Sources/MDRemote"
        ),
        .binaryTarget(
            name: "MeetingDoctorsStorage",
            path: "Frameworks/MeetingDoctorsStorage.xcframework"
        ),
        .target(name: "MeetingDoctorsStorageTargets",
                dependencies: [
                    .target(name: "MeetingDoctorsSchema"),
                    .target(name: "MeetingDoctorsCore"),
                    .target(name: "MeetingDoctorsController"),
                    .target(name: "MeetingDoctorsSocket"),
                    .product(name: "RealmSwift",
                             package: "realm-swift")
                ],
                path: "Sources/MDStorage"
        ),
        .binaryTarget(
            name: "MeetingDoctorsController",
            path: "Frameworks/MeetingDoctorsController.xcframework"
        ),
        .target(name: "MeetingDoctorsControllerTargets",
                dependencies: [
                    .target(name: "MeetingDoctorsSchema"),
                    .target(name: "MeetingDoctorsCore"),
                    .product(name: "RxSwift",
                             package: "RxSwift"),
                    .product(name: "RxBlocking",
                             package: "RxSwift")
                ],
                path: "Sources/MDController"
        ),
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            path: "Frameworks/MeetingDoctorsSDK.xcframework"
        ),
        .target(name: "MeetingDoctorsSDKTargets",
                dependencies: [
                    .target(name: "MeetingDoctorsSchema"),
                    .target(name: "MeetingDoctorsCore"),
                    .target(name: "MeetingDoctorsController"),
                    .target(name: "MeetingDoctorsRemote"),
                    .target(name: "MeetingDoctorsSocket"),
                    .target(name: "MeetingDoctorsStorage"),
                    .product(name: "RxSwift",
                             package: "RxSwift"),
                    .product(name: "RxCocoa",
                             package: "RxSwift"),
                    .product(name: "Swinject",
                             package: "Swinject"),
                    .product(name: "SwinjectStoryboard",
                             package: "SwinjectStoryboard"),
                    .product(name: "OpenTok",
                             package: "OpenTok"),
                    .product(name: "Lottie",
                             package: "lottie-spm")
                ],
                path: "Sources/MDSDK"
        ),
    ]
)
