import Foundation

struct Restaurant {
    let name: String
    let open: Set<Day>

    var isOpen: Bool {
        let dayOfWeek = Calendar.current.component(.weekday, from: Date())
        guard let today = Day(rawValue: dayOfWeek) else {
            NSLog("Today is invalid?? (%d)", dayOfWeek)
            return false
        }
        return open.contains(today)
    }
}
