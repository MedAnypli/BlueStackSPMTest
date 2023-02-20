// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlueStackSPMTest",
    
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BlueStackSPMTest",
            targets: ["BlueStackSDKWrapper"]),
        //            targets: ["BlueStackSDK" , "OMSDK_Madvertise", "BlueStackSASAdapter", "SASDisplayKit", "SCSCoreKit", "BluestackAmazonPublisherServicesAdapter", "DTBiOSSDK", "BlueStackLocationAdapter" ,"MAdvertiseLocation","BlueStackDFPAdapter","GoogleMobileAds"]),
    ],
    dependencies:  [
        //        //        .package(url: "https://mdtb-sdk-packages.s3-us-west-2.amazonaws.com/iOS_APS_SDK/APS_iOS_SDK-4.5.6.zip", .exact("4.5.5")),
        //        .package(url: "https://github.com/BlueStack-SDK/Core", from: "1.0.0"),
        //        .package(url: "https://github.com/smartadserver/Smart-Display-SDK-iOS.git", .upToNextMajor(from: "7.19.1"))
        //PromisesObjC
//        .package(
//            name: "GoogleAppMeasurement",
//            url: "https://github.com/google/GoogleAppMeasurement.git",
//            "7.0.0"..<"11.0.0"
//        ),
//        .package(
//            name: "GoogleUserMessagingPlatform",
//            url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git",
//            "1.1.0"..<"3.0.0"
//        ),
//        .package(
//            name: "Promises",
//            url: "https://github.com/google/promises",
//            from: "1.1.0"
//        )
//        .package(
//            name: "FBLPromises",
//            url: "https://github.com/google/promises/",
//            "2.2.0"
//        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "BlueStackSDKWrapper",
                dependencies: [
                    .target(name: "BlueStackSDK", condition: .when(platforms: [.iOS])),
                    .target(name: "OMSDK_Madvertise", condition: .when(platforms: [.iOS])),
                    //smart
                    .target(name: "BlueStackSASAdapter", condition: .when(platforms: [.iOS])),
                    .target(name: "SASDisplayKit", condition: .when(platforms: [.iOS])),
                    .target(name: "SCSCoreKit", condition: .when(platforms: [.iOS])),
                    //amazon
                    .target(name: "BluestackAmazonPublisherServicesAdapter", condition: .when(platforms: [.iOS])),
                    .target(name: "DTBiOSSDK", condition: .when(platforms: [.iOS])),
                    //adcolony
                    .target(name: "BlueStackAdColonyAdapter", condition: .when(platforms: [.iOS])),
                    //criteo
                    .target(name: "BluestackCriteoAdapter", condition: .when(platforms: [.iOS])),
                    //location
                    .target(name: "BlueStackLocationAdapter", condition: .when(platforms: [.iOS])),
                    .target(name: "MAdvertiseLocation", condition: .when(platforms: [.iOS])),
                    //dfp
                    .target(
                        name: "BlueStackDFPAdapter",
                        condition: .when(platforms: [.iOS])
                    ),
                    //                       .target(name: "GoogleAppMeasurement", condition: .when(platforms: [.iOS])),
                    //                       .target(name: "GoogleAppMeasurementIdentitySupport", condition: .when(platforms: [.iOS])),
                    //                       .target(name: "GoogleMobileAds", condition: .when(platforms: [.iOS])),
                    //                       .target(name: "GoogleUtilities", condition: .when(platforms: [.iOS])),
                    //                       .target(name: "nanopb", condition: .when(platforms: [.iOS])),
//                        .target(name: "FBLPromises", condition: .when(platforms: [.iOS])),
//                    //                       .target(name: "UserMessagingPlatform", condition: .when(platforms: [.iOS])),
                    //ogury
                        .target(name: "BlueStackOguryAdapter", condition: .when(platforms: [.iOS])),
                    .target(name: "OMSDK_Ogury", condition: .when(platforms: [.iOS])),
//                    .product(name: "GoogleAppMeasurement",
//                             package: "GoogleAppMeasurement"),
//                    .product(name: "GoogleUserMessagingPlatform", package: "GoogleUserMessagingPlatform"),
//                    .product(name: "Promises",
//                             package: "Promises"),
//                    .product(name: "FBLPromises", package: "FBLPromises")
                ],
                path: "BlueStackSDKWrapper",
                linkerSettings: [
                    .linkedFramework("AudioToolbox"),
                    .linkedFramework("AVFoundation"),
                    .linkedFramework("CFNetwork"),
                    .linkedFramework("CoreGraphics"),
                    .linkedFramework("CoreMedia"),
                    .linkedFramework("CoreTelephony"),
                    .linkedFramework("CoreVideo"),
                    .linkedFramework("MediaPlayer"),
                    .linkedFramework("MessageUI"),
                    .linkedFramework("MobileCoreServices"),
                    .linkedFramework("QuartzCore"),
                    .linkedFramework("Security"),
                    .linkedFramework("StoreKit"),
                    .linkedFramework("SystemConfiguration"),
                    .linkedLibrary("z"),
                    .linkedLibrary("sqlite3")
                ]
               ),
//        .binaryTarget(name: "FBLPromises",
//                path: "Dependencies/FBLPromises.xcframework"
//               ),
        .binaryTarget(name: "BlueStackSDK", path: "BlueStackSDK.xcframework"),
        .binaryTarget(name: "OMSDK_Madvertise", path: "OMSDK_Madvertise.xcframework"),
        //smart
        .binaryTarget(name: "BlueStackSASAdapter", path: "BlueStackSASAdapter.xcframework"),
        .binaryTarget(name: "BlueStackAdColonyAdapter", path: "BlueStackAdColonyAdapter.xcframework"),
        .binaryTarget(name: "BluestackCriteoAdapter", path: "BluestackCriteoAdapter.xcframework"),
        //dfp
        .binaryTarget(name: "BlueStackDFPAdapter", path: "BlueStackDFPAdapter.xcframework"),
//        .binaryTarget(name: "FBLPromises", path: "Dependencies/FBLPromises.xcframework"),
        //        .binaryTarget(name: "GoogleAppMeasurement", path: "Dependencies/GoogleAppMeasurement.xcframework"),
        //        .binaryTarget(name: "GoogleAppMeasurementIdentitySupport", path: "Dependencies/GoogleAppMeasurementIdentitySupport.xcframework"),
            .binaryTarget(name: "GoogleMobileAds", path: "Dependencies/GoogleMobileAds.xcframework"),
        //        .binaryTarget(name: "GoogleUtilities", path: "Dependencies/GoogleUtilities.xcframework"),
        //        .binaryTarget(name: "nanopb", path: "Dependencies/nanopb.xcframework"),
            .binaryTarget(name: "PromisesObjC", path: "Dependencies/PromisesObjC.xcframework"),
        //        .binaryTarget(name: "UserMessagingPlatform", path: "Dependencies/UserMessagingPlatform.xcframework"),
        //fb
            .binaryTarget(name: "BlueStackFacebookAdapter", path: "BlueStackFacebookAdapter.xcframework"),
        .binaryTarget(name: "BlueStackLocationAdapter", path: "BlueStackLocationAdapter.xcframework"),
        .binaryTarget(name: "BlueStackOguryAdapter", path: "BlueStackOguryAdapter.xcframework"),
        .binaryTarget(name: "BluestackAmazonPublisherServicesAdapter", path: "BluestackAmazonPublisherServicesAdapter.xcframework"),
        //the dependencies
        .binaryTarget(name: "AdColony", path: "Dependencies/AdColony.xcframework"),
        .binaryTarget(name: "DTBiOSSDK", path: "Dependencies/DTBiOSSDK.xcframework"),
        .binaryTarget(name: "FBAudienceNetwork", path: "Dependencies/FBAudienceNetwork.xcframework"),
        .binaryTarget(name: "ImproveDigital", path: "Dependencies/ImproveDigital.xcframework"),
        .binaryTarget(name: "MAdvertiseLocation", path: "Dependencies/MAdvertiseLocation.xcframework"),
        .binaryTarget(name: "OguryAds", path: "Dependencies/OguryAds.xcframework"),
        .binaryTarget(name: "OguryChoiceManager", path: "Dependencies/OguryChoiceManager.xcframework"),
        .binaryTarget(name: "OMSDK_Ogury", path: "Dependencies/OMSDK_Ogury.xcframework"),
        .binaryTarget(name: "SASDisplayKit", path: "Dependencies/SASDisplayKit.xcframework"),
        .binaryTarget(name: "SCSCoreKit", path: "Dependencies/SCSCoreKit.xcframework"),
    ]
)
