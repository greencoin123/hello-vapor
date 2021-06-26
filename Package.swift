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
       .package(name: "FluentMySQL",url: "https://github.com/vapor/fluent-mysql.git",
                from: "3.0.0"),
        .package(name: "Leaf",url: "https://github.com/vapor/leaf.git", from: "3.0.0")
     ],
     targets: [
       // 2
       .target(name: "App", dependencies: ["FluentMySQL","Vapor","Leaf"]),
       .target(name: "Run", dependencies: ["App"]),
       .testTarget(name: "AppTests", dependencies: ["App"]),
     ]

)
