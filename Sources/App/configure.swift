import Vapor
import Fluent
import FluentPostgresDriver
import Leaf

// configures your application
public func configure( _ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    
    // Leaf
    app.views.use(.leaf)
    app.leaf.cache.isEnabled = false
    // middleware
    
    // Database
    app.databases.use(.postgres(hostname: "localhost", username: "vapor", password: "vapor", database: "vapor"), as: .psql)
    
    app.http.server.configuration.port = 9090
    // migration
     
    // register routes
    //try routes(app)
    
}
