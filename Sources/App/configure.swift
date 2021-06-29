import Vapor
import FluentPostgreSQL
import Leaf

// configures your application
public func configure( _ config: inout Config,
_ env: inout Environment, _ services: inout Services) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try routes(app)
    try services.register(FluentPostgreSQLProvider())
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
    let postgresqlConfig = PostgreSQLDatabaseConfig(
        hostname: "127.0.0.1",
        port: 5432,
        username: "steven",
        database: "mydb",
        password: nil
      )
      services.register(postgresqlConfig)
    
    
    // migration
      var migrations = MigrationConfig()
      migrations.add(model: User.self, database: .psql)
      services.register(migrations)

}
