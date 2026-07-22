//
//  QuestionValidator.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation

struct QuestionValidator {

    private static let keywords = [
        "swift",
        "swiftui",
        "uikit",
        "ios",
        "combine",
        "async",
        "await",
        "actor",
        "task",
        "gcd",
        "protocol",
        "delegate",
        "closure",
        "property wrapper",
        "core data",
        "core bluetooth",
        "bluetooth",
        "ble",
        "mvvm",
        "mvc",
        "viper",
        "solid",
        "dependency injection",
        "networking",
        "urlsession",
        "alamofire",
        "xcode",
        "app store",
        "memory management",
        "retain cycle",
        "arc",
        "notificationcenter",
        "core location",
        "swift package",
        "design pattern"
    ]

    static func isValid(question: String) -> Bool {

        let text = question.lowercased()

        return keywords.contains {
            text.contains($0)
        }
    }
}
