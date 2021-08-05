import Vapor
import Fluent


struct UserController: RouteCollection  {
    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("todos")
                todos.get(use: index)
                todos.post(use: create)

    }
    
    
    func index(req: Request) throws -> String {
            return "Hello"
        }

        func create(req: Request) throws -> String {
            return "Created"
        }
}
