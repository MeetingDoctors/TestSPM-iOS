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
                "MeetingDoctorsCoreWrapper",
                "MeetingDoctorsSchemaWrapper",
                "MeetingDoctorsSocketWrapper",
                "MeetingDoctorsRemoteWrapper",
                "MeetingDoctorsStorageWrapper",
                "MeetingDoctorsControllerWrapper",
                "MeetingDoctorsSDKWrapper",
            ]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git",
                 exact: "1.6.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git",
                 exact: "10.8.0"),
//        .package(url: "https://github.com/google/GoogleUtilities#swift-package-manager.git",
//                 exact: "7.11.1"),
        .package(url: "https://github.com/google/promises.git",
                 exact: "2.2.0"),
        .package(url: "https://github.com/socketio/socket.io-client-swift.git",
                 from: "15.2.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git",
                 .upToNextMajor(from: "4.8.0")),
        .package(url: "https://github.com/realm/realm-swift.git",
                 exact: "10.17.0"),
//        .package(url: "https://github.com/realm/realm-cocoa.git",
//                 exact: "10.17.0"),
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
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        // MARK: - MDCore
        .binaryTarget(
            name: "MeetingDoctorsCore",
            path: "Frameworks/MeetingDoctorsCore.xcframework"
        ),
        .target(name: "MeetingDoctorsCoreWrapper",
                dependencies: [
                    .target(name: "MeetingDoctorsCore"),
                    .product(name: "CryptoSwift",
                             package: "CryptoSwift"),
//                    .product(name: "GoogleUtilities",
//                             package: "GoogleUtilities#swift-package-manager"),
                    .product(name: "Promises",
                             package: "promises"),
                    .product(name: "FirebaseAnalytics",
                             package: "firebase-ios-sdk"),
                ],
                path: "Sources/MDCore",
                linkerSettings: [
                    .linkedFramework("Foundation"),
                    .linkedFramework("UIKit"),
                    .linkedFramework("CoreLocation"),
                    .linkedFramework("AVFoundation"),
                ]
               ),
        // MARK: - MDSchema
        .binaryTarget(
            name: "MeetingDoctorsSchema",
            path: "Frameworks/MeetingDoctorsSchema.xcframework"
        ),
        .target(name: "MeetingDoctorsSchemaWrapper",
                dependencies: [
                    .target(name: "MeetingDoctorsSchema"),
                    .target(name: "MeetingDoctorsCoreWrapper"),
                ],
                path: "Sources/MDSchema",
                linkerSettings: [
                    .linkedFramework("Foundation"),
                    .linkedFramework("UIKit"),
                    .linkedFramework("AdSupport"),
                ]
               ),
        // MARK: - MDController
        .binaryTarget(
            name: "MeetingDoctorsController",
            path: "Frameworks/MeetingDoctorsController.xcframework"
        ),
        .target(name: "MeetingDoctorsControllerWrapper",
                dependencies: [
                    .target(name: "MeetingDoctorsController"),
                    .target(name: "MeetingDoctorsSchemaWrapper"),
                    .target(name: "MeetingDoctorsCoreWrapper"),
                    .product(name: "RxSwift",
                             package: "RxSwift"),
                    .product(name: "RxBlocking",
                             package: "RxSwift")
                ],
                path: "Sources/MDController",
                linkerSettings: [
                    .linkedFramework("Foundation"),
                    .linkedFramework("UIKit"),
                    .linkedFramework("CoreLocation"),
                    .linkedFramework("Photos"),
                    .linkedFramework("AdSupport"),
                ]
               ),
        // MARK: - MDSocket
        .binaryTarget(
            name: "MeetingDoctorsSocket",
            path: "Frameworks/MeetingDoctorsSocket.xcframework"
        ),
        .target(name: "MeetingDoctorsSocketWrapper",
                dependencies: [
                    .target(name: "MeetingDoctorsSocket"),
                    .target(name: "MeetingDoctorsSchemaWrapper"),
                    .target(name: "MeetingDoctorsCoreWrapper"),
                    .target(name: "MeetingDoctorsControllerWrapper"),
                    .product(name: "SocketIO",
                             package: "socket.io-client-swift")
                ],
                path: "Sources/MDSocket",
                linkerSettings: [
                    .linkedFramework("Foundation"),
                    .linkedFramework("UIKit"),
                ]
               ),
        // MARK: - MDRemote
        .binaryTarget(
            name: "MeetingDoctorsRemote",
            path: "Frameworks/MeetingDoctorsRemote.xcframework"
        ),
        .target(name: "MeetingDoctorsRemoteWrapper",
                dependencies: [
                    .target(name: "MeetingDoctorsRemote"),
                    .target(name: "MeetingDoctorsSchemaWrapper"),
                    .target(name: "MeetingDoctorsCoreWrapper"),
                    .target(name: "MeetingDoctorsControllerWrapper"),
                    .product(name: "Alamofire",
                             package: "Alamofire")
                ],
                path: "Sources/MDRemote",
                linkerSettings: [
                    .linkedFramework("Foundation"),
                    .linkedFramework("UIKit"),
                ]
               ),
        // MARK: - MDStorage
        .binaryTarget(
            name: "MeetingDoctorsStorage",
            path: "Frameworks/MeetingDoctorsStorage.xcframework"
        ),
        .target(name: "MeetingDoctorsStorageWrapper",
                dependencies: [
                    .target(name: "MeetingDoctorsStorage"),
                    .target(name: "MeetingDoctorsSchemaWrapper"),
                    .target(name: "MeetingDoctorsCoreWrapper"),
                    .target(name: "MeetingDoctorsControllerWrapper"),
                    .target(name: "MeetingDoctorsSocketWrapper"),
                    .product(name: "Realm",
                             package: "realm-swift"), //NOTE: not find realm module
                    .product(name: "RealmSwift",
                             package: "realm-swift")
                ],
                path: "Sources/MDStorage",
                linkerSettings: [
                    .linkedFramework("Foundation"),
                    .linkedFramework("UIKit"),
                    .linkedFramework("CoreLocation"),
//                    .unsafeFlags([
//                        "-Xlinker", "-exclude_arch", "-Xlinker", "arm64"
//                    ])
                ]
               ),
        // MARK: - MDSDK
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            path: "Frameworks/MeetingDoctorsSDK.xcframework"
        ),
        .target(name: "MeetingDoctorsSDKWrapper",
                dependencies: [
                    .target(name: "MeetingDoctorsSDK"),
                    .target(name: "MeetingDoctorsSchemaWrapper"),
                    .target(name: "MeetingDoctorsCoreWrapper"),
                    .target(name: "MeetingDoctorsControllerWrapper"),
                    .target(name: "MeetingDoctorsRemoteWrapper"),
                    .target(name: "MeetingDoctorsSocketWrapper"),
                    .target(name: "MeetingDoctorsStorageWrapper"),
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
                path: "Sources/MDSDK",
                linkerSettings: [
                    .linkedFramework("Foundation"),
                    .linkedFramework("UIKit"),
                    .linkedFramework("CoreLocation"),
                    .linkedFramework("Photos"),
                    .linkedFramework("StoreKit"),
                ]
               ),
    ]
)
