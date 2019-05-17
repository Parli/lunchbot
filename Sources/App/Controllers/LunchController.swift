import Foundation
import Vapor

struct LunchController {
    let restaurants: [Restaurant]
    func pickLunch(_ req: Request) throws -> Future<SlackResponse> {
        return try req.content.decode(SlackRequest.self).map { slackRequest in
            var options = self.restaurants.filter { r in r.isOpen }
            guard options.count > 0 else {
                return SlackResponse(text: "Nothing is open!?", attachments: [])
            }

            var pickCount = 1

            for word in slackRequest.text.split(separator: " ") {
                if let intVal = Int(word) {
                    pickCount = intVal
                    break
                }
            }

            var picks = [Restaurant]()
            while pickCount > 0 && options.count > 0 {
                let pick = options.shuffled().first!
                picks.append(pick)
                options = options.filter { r in r.cuisine != pick.cuisine }
                pickCount -= 1
            }

            let responseText = picks.map { pick in
                "\(pick.name) (\(pick.cuisine))"
            }.joined(separator: "\n")

            return SlackResponse(text: responseText, attachments: [])
        }
    }
}
