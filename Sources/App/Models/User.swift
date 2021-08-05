
import Vapor
import Fluent


final class User: Model {
    
    
    static var schema="users"
    
  @ID(key: .id)
  var id: UUID?
    
  @Field(key: "username")
  var username: String
    
  init() { }
  init(id: UUID? = nil, username: String) {
    self.id = id
    self.username = username
  }
}
extension User: Content {}

extension User: Migration {
    // Prepares the database for storing Galaxy models.
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("users")
            .id()
            .field("username", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("users").delete()
    }
}
