// swift-tools-version:5.2
import PackageDescription



let package = Package(
    name: "hello",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.3.0"),

        .package(url:"https://github.com/vapor/fluent.git", from: "4.0.0-rc"),
        .package(url:"https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0-rc"),
        .package(url: "https://github.com/vapor/jwt.git", from: "4.0.0-rc"),

        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
        /*
        .package(name: "Crypto",url: "https://github.com/vapor/crypto.git", from: "3.0.0"),
        */
        
     ],
     targets: [
       // 2
       .target(name: "App", dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "JWT", package: "jwt"),
                .product(name: "Leaf", package: "leaf"),
                ]),
       .target(name: "Run", dependencies: [.target(name: "App"),]),
       .testTarget(name: "AppTests", dependencies: [.target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
     ]
)
