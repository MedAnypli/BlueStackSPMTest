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
        .package(
            name: "GoogleMobileAds",
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "9.13.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "BlueStackSDKWrapper",
                dependencies: [
//                    "swift-package-manager-google-mobile-ads",
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
                        name: "BlueStackDFPAdapterWrapper",
                        condition: .when(platforms: [.iOS])
                    ),
                    //                       .target(name: "GoogleAppMeasurement", condition: .when(platforms: [.iOS])),
                    //                       .target(name: "GoogleAppMeasurementIdentitySupport", condition: .when(platforms: [.iOS])),
//                    .target(name: "GoogleMobileAds", condition: .when(platforms: [.iOS])),
//                    .target(name: "GoogleUtilities", condition: .when(platforms: [.iOS])),
//                    .target(name: "nanopb", condition: .when(platforms: [.iOS])),
//                    .target(name: "UserMessagingPlatform", condition: .when(platforms: [.iOS])),
//                    .target(name: "PromisesObjC",
//                            condition: .when(platforms: [.iOS])),
                    //ogury
                        .target(name: "BlueStackOguryAdapter", condition: .when(platforms: [.iOS])),
                    .target(name: "OMSDK_Ogury", condition: .when(platforms: [.iOS])),
//                    .product(name: "swift-package-manager-google-mobile-ads",
//                             package: "swift-package-manager-google-mobile-ads"),
                    //                    .product(name: "GoogleUserMessagingPlatform", package: "GoogleUserMessagingPlatform"),
                    //                    .product(name: "Promises",
                    //                             package: "Promises"),
                ],
                path: "BlueStackSDKWrapper",
                linkerSettings: [
                    .linkedFramework("AVFoundation"),
                    .linkedFramework("Accelerate"),
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
                    .linkedFramework("GoogleMobileAds"),
                    .linkedLibrary("ObjC"),
                    .linkedLibrary("c++"),
                    .linkedLibrary("z"),
                    .linkedLibrary("sqlite3")
                ]
               ),
        .target(name: "BlueStackDFPAdapterWrapper",
                dependencies: [
                    "BlueStackDFPAdapter" ,
                    "GoogleMobileAds",
                    "PromisesObjC"
//                    .product(name: "GoogleMobileAds", package: "GoogleMobileAds"),
//                    .target(name: "BlueStackDFPAdapter", condition: .when(platforms: [.iOS])),
                ],
                path: "BlueStackDFPAdapterWrapper"
               ),
        .binaryTarget(name: "BlueStackSDK", path: "BlueStackSDK.xcframework"),
        .binaryTarget(name: "OMSDK_Madvertise", path: "OMSDK_Madvertise.xcframework"),
//        .target(name: "FBLPromises",
//               path: "Dependencies/FBLPromises"),
        //smart
        .binaryTarget(name: "BlueStackSASAdapter", path: "BlueStackSASAdapter.xcframework"),
        .binaryTarget(name: "BlueStackAdColonyAdapter", path: "BlueStackAdColonyAdapter.xcframework"),
        .binaryTarget(name: "BluestackCriteoAdapter", path: "BluestackCriteoAdapter.xcframework"),
        //dfp
        .binaryTarget(name: "BlueStackDFPAdapter", path: "BlueStackDFPAdapter.xcframework"),
        //        .binaryTarget(name: "GoogleAppMeasurement", path: "Dependencies/GoogleAppMeasurement.xcframework"),
        //        .binaryTarget(name: "GoogleAppMeasurementIdentitySupport", path: "Dependencies/GoogleAppMeasurementIdentitySupport.xcframework"),
//            .binaryTarget(name: "GoogleMobileAds", path: "Dependencies/GoogleMobileAds.xcframework"),
//                .binaryTarget(name: "GoogleUtilities", path: "Dependencies/GoogleUtilities.xcframework"),
//                .binaryTarget(name: "nanopb", path: "Dependencies/nanopb.xcframework"),
            .binaryTarget(name: "PromisesObjC", path: "Dependencies/PromisesObjC.xcframework"),
//                .binaryTarget(name: "UserMessagingPlatform", path: "Dependencies/UserMessagingPlatform.xcframework"),
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
