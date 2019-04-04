enum Day: Int {
    // Values match Calendar.component.weekday
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
}
extension Day {
    static let all: Set<Day> = [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday, .sunday]
    static let weekdays: Set<Day> = [.monday, .tuesday, .wednesday, .thursday, .friday]
}
