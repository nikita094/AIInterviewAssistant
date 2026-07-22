//
//  ChatRequest.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation

struct ChatRequest: Encodable {

    let model: String
    let messages: [ChatMessage]

}


