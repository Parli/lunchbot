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
    Restaurant(name: "Mordisko Banh Mi", cuisine: .vietnamese),
    Restaurant(name: "Saigon City", cuisine: .vietnamese, open: Day.all.without(.monday)),
    Restaurant(name: "Fuji Sukiyaki", cuisine: .japanese, open: Day.all.without(.monday)),
    Restaurant(name: "🌮🔔", cuisine: .mexican),
    Restaurant(name: "KFC", cuisine: .american),
    Restaurant(name: "Sajj", cuisine: .mediterranean),
    Restaurant(name: "Karaage Burger", cuisine: .japanese, open: Day.all.without(.monday).without(.tuesday)),
    Restaurant(name: "Bangkok Patio", cuisine: .thai),
    // Imported, not checked thoroughly
    Restaurant(name: "sweetgreen", cuisine: .salad),
    Restaurant(name: "Spicy Heaven", cuisine: .chinese),
    Restaurant(name: "Hotaru Japanese Restaurant", cuisine: .japanese),
    Restaurant(name: "Three Craft Kitchen & Bar", cuisine: .american),
    Restaurant(name: "Amici’s East Coast Pizzeria", cuisine: .pizza),
    Restaurant(name: "Liuyishou Hotpot", cuisine: .soup),
    Restaurant(name: "Clay Oven", cuisine: .indian),
    Restaurant(name: "3rd Avenue Sports Bar & Grill", cuisine: .american),
    Restaurant(name: "L&L Hawaiian Barbecue", cuisine: .hawaiian),
    Restaurant(name: "Ni-Mo", cuisine: .japanese),
    Restaurant(name: "Masu Japanese Bistro", cuisine: .japanese),
    Restaurant(name: "Noodles & Things", cuisine: .soup),
    Restaurant(name: "Rave Burger", cuisine: .burgers),
    Restaurant(name: "noodleosophy", cuisine: .soup),
    Restaurant(name: "Best Of Burma", cuisine: .burmese),
    Restaurant(name: "Sichuan Chong Qing Cuisine", cuisine: .chinese),
    Restaurant(name: "Shabuway Japanese Style Hot Pot", cuisine: .soup),
    Restaurant(name: "The Ace of Sandwiches at Dean’s Produce", cuisine: .sandwiches),
    Restaurant(name: "Le Boulanger", cuisine: .sandwiches),
    Restaurant(name: "Yu-Raku", cuisine: .chinese),
    Restaurant(name: "Fiero Caffe", cuisine: .breakfast),
    Restaurant(name: "Sushi Sam’s Edomata", cuisine: .japanese),
    Restaurant(name: "Suruki Supermarket", cuisine: .japanese),
    Restaurant(name: "The Sandwich Spot", cuisine: .sandwiches),
    Restaurant(name: "Kaz Teriyaki Grill", cuisine: .japanese),
    Restaurant(name: "Ajisen Ramen", cuisine: .ramen),
    Restaurant(name: "Boiling Point", cuisine: .soup),
    Restaurant(name: "The Halal Guys", cuisine: .mediterranean),
    Restaurant(name: "ABC Bakery & Cafe", cuisine: .chinese),
    Restaurant(name: "Eden Silk Road Cuisine", cuisine: .chinese),
    Restaurant(name: "Little China Kitchen", cuisine: .chinese),
    Restaurant(name: "Champagne Seafood Restaurant", cuisine: .chinese),
    Restaurant(name: "Oidon", cuisine: .japanese),
    Restaurant(name: "Pizza My Heart", cuisine: .pizza),
    Restaurant(name: "Pacific Catch", cuisine: .seafood),
    Restaurant(name: "Avocado Toast", cuisine: .sandwiches),
    Restaurant(name: "Little Sheep Mongolian Hot Pot", cuisine: .soup),
    Restaurant(name: "Gyu-Kaku Japanese BBQ", cuisine: .japanese),
    Restaurant(name: "Himawari", cuisine: .ramen),
    Restaurant(name: "B Street & Vine", cuisine: .italian),
    Restaurant(name: "Hummus Mediterranean Kitchen", cuisine: .mediterranean),
    Restaurant(name: "Ben Tre Vietnamese Homestyle Cuisine", cuisine: .vietnamese),
    Restaurant(name: "Thonglor Thai Bistro", cuisine: .thai),
    Restaurant(name: "Mr. Taco Man", cuisine: .mexican),
    Restaurant(name: "Chicken Pho You", cuisine: .vietnamese),
    Restaurant(name: "Mr Pizza Man San Mateo", cuisine: .pizza),
    Restaurant(name: "Central Park Bistro", cuisine: .american),
    Restaurant(name: "Little Sichuan Restaurant", cuisine: .chinese),
    Restaurant(name: "Las Americas", cuisine: .peruvian),
    Restaurant(name: "North Beach Pizza", cuisine: .pizza),
    Restaurant(name: "Domino’s Pizza", cuisine: .pizza),
    Restaurant(name: "Pausa Bar & Cookery", cuisine: .italian),
    Restaurant(name: "Pancho Villa Taqueria", cuisine: .mexican),
    Restaurant(name: "Vault 164", cuisine: .american),
    Restaurant(name: "Izakaya Mai", cuisine: .japanese),
    Restaurant(name: "New York Pizza - San Mateo", cuisine: .pizza),
    Restaurant(name: "New Thai Elephant", cuisine: .thai),
    Restaurant(name: "Bonchon", cuisine: .korean),
    Restaurant(name: "Fire Wings", cuisine: .american),
    Restaurant(name: "Las Palomas Taqueria", cuisine: .mexican),
    Restaurant(name: "31st Union", cuisine: .american),
    Restaurant(name: "Curry Up Now", cuisine: .indian),
    Restaurant(name: "Pokeatery", cuisine: .poke),
    Restaurant(name: "Inchin’s Bamboo Garden", cuisine: .asian),
    Restaurant(name: "Old Town Sushi", cuisine: .japanese),
    Restaurant(name: "Old Town Ramen", cuisine: .japanese),
    Restaurant(name: "Koja Kitchen", cuisine: .asian),
    Restaurant(name: "Hu Tong Jian Bing", cuisine: .chinese),
    Restaurant(name: "Tomatina", cuisine: .italian),
    Restaurant(name: "Wing Fat Restaurant", cuisine: .chinese),
    Restaurant(name: "Fletch’s Hot Dogs", cuisine: .american),
    Restaurant(name: "31st Ready Made", cuisine: .american),
    Restaurant(name: "Wursthall", cuisine: .german),
    Restaurant(name: "The Ravioli House", cuisine: .sandwiches),
    Restaurant(name: "Central Market and Cafe", cuisine: .sandwiches),
    Restaurant(name: "Jeffrey’s Hamburgers", cuisine: .burgers),
    Restaurant(name: "China Bee", cuisine: .chinese),
    Restaurant(name: "Antojitos Salvadoreños Aminta", cuisine: .salvadorian),
    Restaurant(name: "Bill’s Hofbrau", cuisine: .german),
    Restaurant(name: "Joy Sushi", cuisine: .japanese),
    Restaurant(name: "Ike’s Place", cuisine: .sandwiches),
    Restaurant(name: "Karaage Burger", cuisine: .burgers),
    Restaurant(name: "Taqueria Las Cazuelas", cuisine: .mexican),
    Restaurant(name: "Taqueria El Nayarita", cuisine: .mexican),
    Restaurant(name: "New Wing Fat", cuisine: .chinese),
    Restaurant(name: "Taqueria La Cumbre", cuisine: .mexican),
    Restaurant(name: "Little Caesars Pizza", cuisine: .pizza),
    Restaurant(name: "Everyday Beijing", cuisine: .chinese),
    Restaurant(name: "Al Carbon", cuisine: .peruvian),
    Restaurant(name: "Fusion Peruvian Grill", cuisine: .peruvian),
    Restaurant(name: "Ramen Dojo", cuisine: .ramen),
    Restaurant(name: "Charlie’s Taqueria", cuisine: .mexican),
    Restaurant(name: "Tacos Al Vapor", cuisine: .mexican),
    Restaurant(name: "Los Primos Taqueria", cuisine: .mexican),
    Restaurant(name: "Ramen Parlor", cuisine: .ramen),
    Restaurant(name: "Golden 9th Deli & market", cuisine: .sandwiches),
]
