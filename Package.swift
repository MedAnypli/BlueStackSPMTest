// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlueStackSPMTest",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BlueStackSPMTest",
            targets: ["BlueStackSDK",
                      "OMSDK_Madvertise",
                      "BlueStackAdColonyAdapter",
                      "BluestackAmazonPublisherServicesAdapter",
                      "BluestackCriteoAdapter",
                      "BlueStackDFPAdapter",
                      "BlueStackFacebookAdapter",
                      "BlueStackLocationAdapter",
                      "BlueStackOguryAdapter",
                      "BlueStackSASAdapter"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
//        .package(url: "AmazonPublisherServicesSDK", exact:("1.0.0"))
        .package(url: "https://github.com/amzn/amazon-publisher-services-ios.git", from:"4.5.5"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: "BlueStackSDK", path: "BlueStackSDK.xcframework"),
        .binaryTarget(name: "OMSDK_Madvertise", path: "OMSDK_Madvertise.xcframework"),
        .binaryTarget(name: "BlueStackAdColonyAdapter", path: "BlueStackAdColonyAdapter.xcframework"),
        .binaryTarget(name: "BluestackCriteoAdapter", path: "BluestackCriteoAdapter.xcframework"),
        .binaryTarget(name: "BlueStackDFPAdapter", path: "BlueStackDFPAdapter.xcframework"),
        .binaryTarget(name: "BlueStackFacebookAdapter", path: "BlueStackFacebookAdapter.xcframework"),
        .binaryTarget(name: "BlueStackLocationAdapter", path: "BlueStackLocationAdapter.xcframework"),
        .binaryTarget(name: "BlueStackOguryAdapter", path: "BlueStackOguryAdapter.xcframework"),
        .binaryTarget(name: "BlueStackSASAdapter", path: "BlueStackSASAdapter.xcframework"),
        .binaryTarget(name: "BluestackAmazonPublisherServicesAdapter", path: "BluestackAmazonPublisherServicesAdapter.xcframework"),
    ]
)
