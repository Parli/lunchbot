import Vapor

struct SlackRequest: Content {
    let command: String
    let text: String
}

struct SlackResponse: Content {
    let text: String
    let response_type: String = "in_channel"
    let attachments: [SlackAttachment]
}
struct SlackAttachment: Content {
    let text: String
}
