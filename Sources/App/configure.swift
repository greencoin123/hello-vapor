import Vapor
import FluentMySQL
import Leaf

// configures your application
public func configure( _ config: inout Config,
_ env: inout Environment, _ services: inout Services) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try routes(app)
    try services.register(MySQLProvider())
    
    try services.register(FluentMySQLProvider())
    // router
      let router = EngineRouter.default()
      try routes(router)
      services.register(router, as: Router.self)
    // Leaf
      let leafProvider = LeafProvider()
      try services.register(leafProvider)
      config.prefer(LeafRenderer.self, for: ViewRenderer.self)
    // middleware
      var middlewares = MiddlewareConfig()
      middlewares.use(ErrorMiddleware.self)
      services.register(middlewares)
    // Database
      var databases = DatabasesConfig()
    
      let databaseConfig = MySQLDatabaseConfig(
        hostname: "localhost",
        username: "vapor",
        password: "password",
        database: "vapor")
      let database = MySQLDatabase(config: databaseConfig)
      databases.add(database: database, as: .mysql)
      services.register(databases)
    
    // migration
      var migrations = MigrationConfig()
      migrations.add(model: User.self, database: .mysql)
      services.register(migrations)

}
