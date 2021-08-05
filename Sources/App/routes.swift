import Vapor

public func routes(_ app: Application) throws {
    _ = UserController()  
    //app.get("users", use: userController.list)
    
    //app.post("users", use: userController.create)
    
    try app.register(collection: UserController())
}
