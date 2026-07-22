//
//  ChatViewModel.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation

final class ChatViewModel: ObservableObject {
    
    @Published var messages: [Message] = []
    
    @Published var currentMessage = ""
    
    @Published var isLoading = false
    
    @Published var errorMessage: String?
    
    private let aiService: AIService
    
    init(aiService: AIService = OpenAIService()) {
        self.aiService = aiService
    }
    
    @MainActor
    func sendMessage() async {
        
        let text = currentMessage.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        
        guard !text.isEmpty else {
            return
        }
        
        guard QuestionValidator.isValid(question: text) else {

            errorMessage = """
            This assistant only answers Swift and iOS interview questions.
            """

            return
        }
        
        let userMessage = Message(
            role: .user,
            content: text
        )
        
        messages.append(userMessage)
        
        currentMessage = ""
        
        do {
            
            isLoading = true
            defer { isLoading = false }
            
            let reply = try await aiService.send(message: text)
            
            messages.append(
                Message(
                    role: .assistant,
                    content: reply
                )
            )
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
