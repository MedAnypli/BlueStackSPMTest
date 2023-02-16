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
//        .package(url: "https://github.com/google/promises", exact: "2.1.1")
        .package(name: "Promises", url: "https://github.com/google/promises.git", "1.2.8" ..< "1.3.0"),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        //        .target(name: "BlueStackSPMTest", dependencies: ["BlueStackSDK","OMSDK_Madvertise", "BluestackAmazonPublisherServicesAdapter", "BlueStackAdColonyAdapter"]),
        .target(name: "BlueStackSDKWrapper",
                dependencies: [
                       .target(name: "BlueStackSDK", condition: .when(platforms: [.iOS])),
                       .target(name: "OMSDK_Madvertise", condition: .when(platforms: [.iOS])),
                       .target(name: "BlueStackSASAdapterWrapper", condition: .when(platforms: [.iOS])),
                       .target(name: "BluestackAmazonPublisherServicesAdapter", condition: .when(platforms: [.iOS])),
                       .target(name: "BlueStackAdColonyAdapter", condition: .when(platforms: [.iOS])),
                       .target(name: "BluestackCriteoAdapter", condition: .when(platforms: [.iOS])),
                       .target(name: "BlueStackDFPAdapter", condition: .when(platforms: [.iOS])),
                       .target(name: "BlueStackFacebookAdapter", condition: .when(platforms: [.iOS])),
                       .target(name: "BlueStackOguryAdapter", condition: .when(platforms: [.iOS])),
                       .product(name: "FBLPromises", package: "Promises"),
                     ],
             path: "BlueStackSDKWrapper",
             linkerSettings: [
               .linkedLibrary("sqlite3"),
               .linkedLibrary("c++"),
               .linkedLibrary("z"),
               .linkedFramework("StoreKit"),
             ]
           ),
        .binaryTarget(name: "BlueStackSDK", path: "BlueStackSDK.xcframework"),
        .binaryTarget(name: "OMSDK_Madvertise", path: "OMSDK_Madvertise.xcframework"),
         //smart
        .binaryTarget(name: "BlueStackSASAdapter", path: "BlueStackSASAdapter.xcframework"),
        .target(name: "BlueStackSASAdapterWrapper",
                dependencies: [
                       .target(name: "BlueStackSASAdapter", condition: .when(platforms: [.iOS])),
                       .target(name: "SASDisplayKit", condition: .when(platforms: [.iOS])),
                       .target(name: "SCSCoreKit", condition: .when(platforms: [.iOS])),
                     ],
             path: "BlueStackSDKWrapper",
             linkerSettings: [
               .linkedLibrary("sqlite3"),
               .linkedLibrary("c++"),
               .linkedLibrary("z"),
               .linkedFramework("StoreKit"),
             ]
           ),
        .binaryTarget(name: "BlueStackAdColonyAdapter", path: "BlueStackAdColonyAdapter.xcframework"),
        .binaryTarget(name: "BluestackCriteoAdapter", path: "BluestackCriteoAdapter.xcframework"),
        .binaryTarget(name: "BlueStackDFPAdapter", path: "BlueStackDFPAdapter.xcframework"),
        .binaryTarget(name: "BlueStackFacebookAdapter", path: "BlueStackFacebookAdapter.xcframework"),
        .binaryTarget(name: "BlueStackLocationAdapter", path: "BlueStackLocationAdapter.xcframework"),
        .binaryTarget(name: "BlueStackOguryAdapter", path: "BlueStackOguryAdapter.xcframework"),
        //        .binaryTarget(name: "BlueStackSASAdapter", path: "BlueStackSASAdapter.xcframework"),
        .binaryTarget(name: "BluestackAmazonPublisherServicesAdapter", path: "BluestackAmazonPublisherServicesAdapter.xcframework"),
        //the dependencies
        .binaryTarget(name: "AdColony", path: "Dependencies/AdColony.xcframework"),
        .binaryTarget(name: "DTBiOSSDK", path: "Dependencies/DTBiOSSDK.xcframework"),
        .binaryTarget(name: "FBAudienceNetwork", path: "Dependencies/FBAudienceNetwork.xcframework"),
        .binaryTarget(name: "GoogleMobileAds", path: "Dependencies/GoogleMobileAds.xcframework"),
        .binaryTarget(name: "ImproveDigital", path: "Dependencies/ImproveDigital.xcframework"),
        .binaryTarget(name: "MAdvertiseLocation", path: "Dependencies/MAdvertiseLocation.xcframework"),
        .binaryTarget(name: "OguryAds", path: "Dependencies/OguryAds.xcframework"),
        .binaryTarget(name: "OguryChoiceManager", path: "Dependencies/OguryChoiceManager.xcframework"),
        .binaryTarget(name: "OMSDK_Ogury", path: "Dependencies/OMSDK_Ogury.xcframework"),
        .binaryTarget(name: "SASDisplayKit", path: "Dependencies/SASDisplayKit.xcframework"),
        .binaryTarget(name: "SCSCoreKit", path: "Dependencies/SCSCoreKit.xcframework"),
    ]
)


//        .target(name: "FBLPromises",
//                dependencies: [.product(name: "FBLPromises", package: "Promises")],
//              )
