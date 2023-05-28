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
            name: "MeetingDoctorsCoreLibrary",
            targets: [
                "MeetingDoctorsCoreTarget",
            ]),
        .library(
            name: "MeetingDoctorsSchemaLibrary",
            targets: [
                "MeetingDoctorsCoreTarget",
                "MeetingDoctorsSchemaTarget"
            ]),
        .library(
            name: "MeetingDoctorsControllerLibrary",
            targets: [
                "MeetingDoctorsCoreTarget",
                "MeetingDoctorsSchemaTarget",
                "MeetingDoctorsControllerTarget"
            ]),
        .library(
            name: "MeetingDoctorsSocketLibrary",
            targets: [
                "MeetingDoctorsCoreTarget",
                "MeetingDoctorsSchemaTarget",
                "MeetingDoctorsControllerTarget",
                "MeetingDoctorsSocketTarget"
            ]),
        .library(
            name: "MeetingDoctorsRemoteLibrary",
            targets: [
                "MeetingDoctorsCoreTarget",
                "MeetingDoctorsSchemaTarget",
                "MeetingDoctorsControllerTarget",
                "MeetingDoctorsRemoteTarget",
            ]),
        .library(
            name: "MeetingDoctorsSDKLibrary",
            targets: [
                "MeetingDoctorsCoreTarget",
                "MeetingDoctorsSchemaTarget",
                "MeetingDoctorsControllerTarget",
                "MeetingDoctorsRemoteTarget",
                "MeetingDoctorsSocketTarget",
                "MeetingDoctorsSDKTarget"
            ]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git",
                 exact: "10.8.0"),
        .package(url: "https://github.com/socketio/socket.io-client-swift.git",
                 from: "15.2.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git",
                 .upToNextMajor(from: "4.8.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git",
                 from: "6.5.0"),
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
        .target(name: "MeetingDoctorsCoreTarget",
                dependencies: [
                    .target(name: "MeetingDoctorsCore"),
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
        .target(name: "MeetingDoctorsSchemaTarget",
                dependencies: [
                    .target(name: "MeetingDoctorsSchema"),
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
        .target(name: "MeetingDoctorsControllerTarget",
                dependencies: [
                    .target(name: "MeetingDoctorsController"),
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
        .target(name: "MeetingDoctorsSocketTarget",
                dependencies: [
                    .target(name: "MeetingDoctorsSocket"),
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
        .target(name: "MeetingDoctorsRemoteTarget",
                dependencies: [
                    .target(name: "MeetingDoctorsRemote"),
                    .product(name: "Alamofire",
                             package: "Alamofire")
                ],
                path: "Sources/MDRemote",
                linkerSettings: [
                    .linkedFramework("Foundation"),
                    .linkedFramework("UIKit"),
                ]
        ),
        // MARK: - MDSDK
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            path: "Frameworks/MeetingDoctorsSDK.xcframework"
        ),
        .target(name: "MeetingDoctorsSDKTarget",
                dependencies: [
                    .target(name: "MeetingDoctorsSDK"),
                    .product(name: "RxSwift",
                             package: "RxSwift"),
                    .product(name: "RxCocoa",
                             package: "RxSwift"),
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
