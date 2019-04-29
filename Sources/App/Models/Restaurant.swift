import Foundation

struct Restaurant {
    enum Cuisine: String {
        case vietnamese
        case japanese
        case mexican
        case american
        case mediterranean
        case thai
        case chinese
    }

    let name: String
    let open: Set<Day>
    let cuisine: Cuisine

    init(name: String, cuisine: Cuisine, open: Set<Day> = Day.all) {
        self.name = name
        self.cuisine = cuisine
        self.open = open
    }

    var isOpen: Bool {
        let dayOfWeek = Calendar.current.component(.weekday, from: Date())
        guard let today = Day(rawValue: dayOfWeek) else {
            NSLog("Today is invalid?? (%d)", dayOfWeek)
            return false
        }
        return open.contains(today)
    }
}
