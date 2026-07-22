//
//  APIConstant.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation

struct APIConstant {

    static let baseURL = "https://generativelanguage.googleapis.com/v1beta"

    static var apiKey: String {
        Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
    }

    static let model = "gemini-flash-latest"
}
