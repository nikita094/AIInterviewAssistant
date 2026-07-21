//
//  ChatResponse.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation

struct ChatResponse: Decodable {

    let choices: [Choice]

}

struct Choice: Decodable {

    let message: AssistantMessage

}

struct AssistantMessage: Decodable {

    let role: String
    let content: String

}
