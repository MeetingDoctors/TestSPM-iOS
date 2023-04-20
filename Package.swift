// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestSPM",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TestSPM",
            targets: [
                "TestSPM",
                "MeetingDoctorsEmmaSDK"
            ]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
//        update MeetingDoctors-Schema MeetingDoctors-Core MeetingDoctors-Remote MeetingDoctors-Storage MeetingDoctors-Controller MeetingDoctorsSDK MeetingDoctorsEmmaSDK MeetingDoctorsServicesSDK
        .target(
            name: "TestSPM"
        ),
        .binaryTarget(
            name: "MeetingDoctorsEmmaSDK",
            path: "Frameworks/MeetingDoctorsEmmaSDK.xcframework"
        )
    ]
)
