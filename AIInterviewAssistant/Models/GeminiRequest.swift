//
//  GeminiRequest.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation


struct GeminiRequest: Codable {
    let contents: [Content]
}

struct Content: Codable {
    let parts: [Part]
}

struct Part: Codable {
    let text: String
}
