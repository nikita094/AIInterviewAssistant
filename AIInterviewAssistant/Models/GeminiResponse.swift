//
//  GeminiResponse.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation


struct GeminiResponse: Codable {
    let candidates: [Candidate]
}

struct Candidate: Codable {
    let content: ContentResponse
}

struct ContentResponse: Codable {
    let parts: [PartResponse]
}

struct PartResponse: Codable {
    let text: String
}
