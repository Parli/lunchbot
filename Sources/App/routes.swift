import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    router.get("healthz") { req in
        return "OK"
    }

    let lunchController = LunchController(restaurants: restaurants)
    router.post("lunch", use: lunchController.pickLunch)

    // Example of configuring a controller
//    let todoController = TodoController()
//    router.get("todos", use: todoController.index)
//    router.post("todos", use: todoController.create)
//    router.delete("todos", Todo.parameter, use: todoController.delete)
}


let restaurants: [Restaurant] = [
    Restaurant(name: "Banh Mi", cuisine: .vietnamese),
    Restaurant(name: "Pho", cuisine: .vietnamese, open: Day.all.without(.monday)),
    Restaurant(name: "Sushi", cuisine: .japanese, open: Day.all.without(.monday)),
    Restaurant(name: "🌮🔔", cuisine: .mexican),
    Restaurant(name: "KFC", cuisine: .american),
    Restaurant(name: "Sajj", cuisine: .mediterranean),
    Restaurant(name: "Karaage Burger", cuisine: .japanese, open: Day.all.without(.monday).without(.tuesday)),
    Restaurant(name: "Zen Noodle", cuisine: .chinese),
    Restaurant(name: "Thai", cuisine: .thai)
]
