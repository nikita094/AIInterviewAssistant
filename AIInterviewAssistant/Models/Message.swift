//
//  Message.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation

struct Message: Identifiable, Codable, Equatable {

    let id: UUID
    let role: Role
    let content: String

    init(
        id: UUID = UUID(),
        role: Role,
        content: String
    ) {
        self.id = id
        self.role = role
        self.content = content
    }
}

extension Message {

    enum Role: String, Codable {
        case user
        case assistant
        case system
    }
}
