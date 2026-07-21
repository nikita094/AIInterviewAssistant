//
//  EndPoint.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation

enum Endpoint {

    case chat

    var path: String {

        switch self {

        case .chat:
            return "/chat/completions"
        }
    }

    var url: URL? {

        URL(string: APIConstants.baseURL + path)

    }

}
