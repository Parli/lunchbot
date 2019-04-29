import Foundation

extension Set {
    func without(_ member: Element) -> Set<Element> {
        var next = self
        next.remove(member)
        return next
    }
}
