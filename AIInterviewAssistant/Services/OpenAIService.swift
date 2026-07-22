//
//  OpenAIService.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation


final class OpenAIService: AIService {

    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func send(message: String) async throws -> String {

        let request = ChatRequest(
            model: APIConstant.model,
            messages: [
                ChatMessage(
                    role: "user",
                    content: message
                )
            ]
        )

        let endpoint = Endpoint.chat(request)

        let response: ChatResponse =
            try await apiClient.send(
                request: endpoint.makeRequest()
            )

        return response
            .choices
            .first?
            .message
            .content ?? ""
    }
}
