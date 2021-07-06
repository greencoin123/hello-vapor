// swift-tools-version:5.2
import PackageDescription



let package = Package(
    name: "hello",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        .package(name: "Vapor",url: "https://github.com/vapor/vapor.git",
                from: "3.0.0"),

       // 1
       .package(name: "FluentPostgreSQL",url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0-rc"),
        .package(name: "Leaf",url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
        .package(name: "Crypto",url: "https://github.com/vapor/crypto.git", from: "3.0.0"),
        
     ],
     targets: [
       // 2
       .target(name: "App", dependencies: ["Crypto","Random","FluentPostgreSQL","Vapor","Leaf"]),
       .target(name: "Run", dependencies: ["App"]),
       .testTarget(name: "AppTests", dependencies: ["App"]),
     ]

)
