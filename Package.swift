// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlueStackSPMTest",
    platforms: [.iOS(.v12)],
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
                    url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "9.13.0"),
        //        .package(url: "https://github.com/google/promises.git", from: "2.2.0")
//        .package(
//            name: "Promises",
//            url: "https://github.com/google/promises.git",
//            branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "BlueStackSDKWrapper",
                dependencies: [
//                    .product(name: "FBLPromises", package: "Promises"),
//                    .product(name: "Promises", package: "Promises"),
//                    .product(name: "FBLPromisesTestHelpers", package: "Promises"),
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
                    //                    .target(name: "BlueStackImproveAdapter", condition: .when(platforms: [.iOS])),
                    //comment for now because we need FBLPromises
                    //dfp
                        .target(
                            name: "BlueStackDFPAdapterWrapper",
                            condition: .when(platforms: [.iOS])
                        ),
                    //ogury
                    .target(name: "BlueStackOguryAdapter", condition: .when(platforms: [.iOS])),
                    .target(name: "OMSDK_Ogury", condition: .when(platforms: [.iOS])),
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
                    .linkedLibrary("ObjC"),
                    .linkedLibrary("c++"),
                    .linkedLibrary("z"),
                    .linkedLibrary("sqlite3")
                ]
               ),
        .target(name: "BlueStackDFPAdapterWrapper",
                dependencies: [
//                    "GoogleMobileAds",
//                    .product(name: "GoogleMobileAds", package: "GoogleMobileAds"),
//                    .product(name: "Promises", package: "GoogleMobileAds"),
//                    .product(name: "nanopb", package: "GoogleMobileAds"),
//                    .product(name: "GoogleUtilities", package: "GoogleMobileAds"),
//                    .product(name: "GoogleAppMeasurement", package: "GoogleMobileAds"),
//                    .product(name: "GoogleUserMessagingPlatform", package: "GoogleMobileAds"),
                    .target(name: "FBLPromises", condition: .when(platforms: [.iOS])),
                    .target(name: "GoogleUtilities", condition: .when(platforms: [.iOS])),
                    .target(name: "nanopb", condition: .when(platforms: [.iOS])),
                     .target(name: "BlueStackDFPAdapter", condition: .when(platforms: [.iOS])),
                ],
                path: "BlueStackDFPAdapterWrapper"
               ),
        //for dfp dependencies
        .binaryTarget(name: "FBLPromises", path: "Dependencies/FBLPromises.xcframework"),
        .binaryTarget(name: "GoogleUtilities", path: "Dependencies/GoogleUtilities.xcframework"),
        .binaryTarget(name: "nanopb", path: "Dependencies/nanopb.xcframework"),
        //core
        .binaryTarget(name: "BlueStackSDK", path: "BlueStackSDK.xcframework"),
        .binaryTarget(name: "OMSDK_Madvertise", path: "OMSDK_Madvertise.xcframework"),
        //smart
        .binaryTarget(name: "BlueStackSASAdapter", path: "BlueStackSASAdapter.xcframework"),
        .binaryTarget(name: "SASDisplayKit", path: "Dependencies/SASDisplayKit.xcframework"),
        .binaryTarget(name: "SCSCoreKit", path: "Dependencies/SCSCoreKit.xcframework"),
        //adcolony
        .binaryTarget(name: "BlueStackAdColonyAdapter", path: "BlueStackAdColonyAdapter.xcframework"),
        .binaryTarget(name: "AdColony", path: "Dependencies/AdColony.xcframework"),
        //criteo
        .binaryTarget(name: "BluestackCriteoAdapter", path: "BluestackCriteoAdapter.xcframework"),
        //dfp
        .binaryTarget(name: "BlueStackDFPAdapter", path: "BlueStackDFPAdapter.xcframework"),
        .binaryTarget(name: "GoogleMobileAds", path: "Dependencies/GoogleMobileAds.xcframework"),
        //fb
        .binaryTarget(name: "BlueStackFacebookAdapter", path: "BlueStackFacebookAdapter.xcframework"),
        .binaryTarget(name: "FBAudienceNetwork", path: "Dependencies/FBAudienceNetwork.xcframework"),
        //location
        .binaryTarget(name: "BlueStackLocationAdapter", path: "BlueStackLocationAdapter.xcframework"),
        .binaryTarget(name: "MAdvertiseLocation", path: "Dependencies/MAdvertiseLocation.xcframework"),
        //ogury
        .binaryTarget(name: "BlueStackOguryAdapter", path: "BlueStackOguryAdapter.xcframework"),
        .binaryTarget(name: "OguryAds", path: "Dependencies/OguryAds.xcframework"),
        .binaryTarget(name: "OguryChoiceManager", path: "Dependencies/OguryChoiceManager.xcframework"),
        .binaryTarget(name: "OMSDK_Ogury", path: "Dependencies/OMSDK_Ogury.xcframework"),
        //amazon
        .binaryTarget(name: "BluestackAmazonPublisherServicesAdapter", path: "BluestackAmazonPublisherServicesAdapter.xcframework"),
        .binaryTarget(name: "DTBiOSSDK", path: "Dependencies/DTBiOSSDK.xcframework"),
       //Improve
        .binaryTarget(name: "BlueStackImproveAdapter", path: "BlueStackImproveAdapter.xcframework"),
        .binaryTarget(name: "ImproveDigital", path: "Dependencies/ImproveDigital.xcframework"),
    ]
)
