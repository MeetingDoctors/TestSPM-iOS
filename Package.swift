// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MDVideocallSDKSPM",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "MDVideocallSDKSPM",
            targets: [
                "MDVideocallSDKSPM",
            ]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/socketio/socket.io-client-swift.git",
                 from: "15.2.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git",
                 from: "6.5.0"),
        .package(url: "https://github.com/opentok/vonage-client-sdk-video",
                 from: "2.26.0"),
        .package(url: "https://github.com/airbnb/lottie-spm.git",
                 from: "4.1.2")
    ],
    targets: [
        .target(name: "MDVideocallSDKSPM",
                dependencies: [
                    .target(name: "MDVideocallSDK"),
                    .product(name: "SocketIO",
                             package: "socket.io-client-swift"),
                    .product(name: "RxSwift",
                             package: "RxSwift"),
                    .product(name: "RxCocoa",
                             package: "RxSwift"),
                    .product(name: "VonageClientSDKVideo",
                             package: "vonage-client-sdk-video"),
                    .product(name: "Lottie",
                             package: "lottie-spm")
                ]
               ),
        .binaryTarget(
            name: "MDVideocallSDK",
            path: "Frameworks/MDVideocallSDK.xcframework"
        )
    ]
)


