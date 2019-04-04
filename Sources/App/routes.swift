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


struct SlackRequest: Content {
    let command: String
    let text: String
}

struct SlackResponse: Content {
    let text: String
    let attachments: [SlackAttachment]
}
struct SlackAttachment: Content {
    let text: String
}


let restaurants: [Restaurant] = [
    Restaurant(name: "Banh Mi", open: Day.all),
    Restaurant(name: "Pho", open: Day.all.without(.monday)),
    Restaurant(name: "Sushi", open: Day.all.without(.monday)),
    Restaurant(name: "🌮🔔", open: Day.all),
    Restaurant(name: "KFC", open: Day.all),
    Restaurant(name: "Sajj", open: Day.all),
    Restaurant(name: "Karaage Burger", open: Day.all.without(.monday).without(.tuesday)),
    Restaurant(name: "Zen Noodle", open: Day.all),
    Restaurant(name: "Thai", open: Day.all)
]

extension Set {
    func without(_ member: Element) -> Set<Element> {
        var next = self
        next.remove(member)
        return next
    }
}
