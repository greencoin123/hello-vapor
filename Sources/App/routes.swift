import Vapor

func routes(_ router: Router) throws {
    let userController = UserController()  
    router.get("users", use: userController.list)
    
    router.post("users", use: userController.create)
}
