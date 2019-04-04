import Foundation
import Vapor

struct LunchController {
    let restaurants: [Restaurant]
    func pickLunch(_ req: Request) throws -> Future<SlackResponse> {
        return try req.content.decode(SlackRequest.self).map { slackRequest in
            guard let pick = (self.restaurants
                .filter { r in r.isOpen }
                .shuffled()
                .first
            ) else {
                return SlackResponse(text: "Nothing is open!?", attachments: [])
            }

            return SlackResponse(text: pick.name, attachments: [])
        }
    }
}
