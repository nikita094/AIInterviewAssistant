//
//  MessageBubble.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import SwiftUI


struct MessageBubble: View {
    
    let message: Message
    
    var body: some View {
        
        HStack {
            
            if message.role == .assistant {
                
                bubble
                Spacer()
                
            } else {
                
                Spacer()
                bubble
            }
        }
    }
    
    private var bubble: some View {
        
        Text(message.content)
            .padding()
            .foregroundStyle(
                message.role == .user
                ? .white
                : .primary
            )
            .background(
                message.role == .user
                ? Color.blue
                : Color.gray.opacity(0.2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
