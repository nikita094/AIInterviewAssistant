//
//  ChatView.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import SwiftUI


struct ChatView: View {
    
    @StateObject
    private var viewModel = ChatViewModel()
    private let suggestions = [
        "Explain Dependency Injection",
        "What are Swift Actors?",
        "Explain MVVM with Example",
        "Difference between async let & Task"
    ]
    @State private var question = ""
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 0) {
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 28) {

                        headerView

                        if viewModel.messages.isEmpty {

                            suggestionSection

                            emptyStateView

                        } else {

                            messageList
                        }
                    }
                    .padding()
                    
                }
                
                Divider()
                // 👇 Show validation/error message here
                   if let error = viewModel.errorMessage {
                       HStack(spacing: 8) {

                              Image(systemName: "exclamationmark.triangle.fill")
                                  .foregroundColor(.orange)

                              Text(error)
                                  .font(.footnote)

                              Spacer()
                          }
                          .padding()
                          .background(Color.orange.opacity(0.15))
                          .clipShape(RoundedRectangle(cornerRadius: 12))
                          .padding(.horizontal)
                          .padding(.top, 8)
                   }
                
                inputView
                
            }
            .navigationBarHidden(true)
            .background(Color(.systemGroupedBackground))
        }
    }
}

private extension ChatView {
    
    var messageList: some View {
        
        ScrollView {
            
            LazyVStack(spacing: 12) {
                
                ForEach(viewModel.messages) { message in
                    
                    MessageBubble(message: message)
                }
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .padding()
                }
            }
            .padding()
        }
    }
}
private extension ChatView {
    
    var inputView: some View {
        
        HStack(spacing: 12) {
            
            TextField(
                "Ask an interview question...",
                text: $viewModel.currentMessage
                // axis: .vertical
            )
            .onChange(of: viewModel.currentMessage) { _ in
                viewModel.errorMessage = nil
            }
            
            
            
            Button() {
                Task {
                    await viewModel.sendMessage()
                }
                
                
            } label: {
                
                Image(systemName: "paperplane.fill")
                    .font(.title3)
                
            }
            // .disabled($viewModel.currentMessage)
            
        }
        .padding()
        
        .background(Color(.systemBackground))
        
        
        
        
    }
}
private extension ChatView {
    
    var emptyStateView: some View {
        
        VStack(spacing: 20) {
            
            Image(systemName: "brain.head.profile")
                .font(.system(size: 60))
                .foregroundStyle(.indigo)
            
            Text("Welcome!")
                .font(.title.bold())
            
            Text("Ask your first Swift or iOS interview question.")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 80)
        
    }
    
}
private extension ChatView {
    
    var headerView: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text("🤖 AI Interview Assistant")
                .font(.largeTitle.bold())
            
            Text("Learn Swift. Build Better Apps.")
                .font(.title3)
                .foregroundStyle(.secondary)
            
        }
    }
    
}
private extension ChatView {
    
    var suggestionSection: some View {
        
        VStack(alignment: .leading, spacing: 14) {
            
            Text("💡 Try asking...")
                .font(.headline)
            
            ForEach(suggestions, id: \.self) { suggestion in
                
                Button {
                    
                    question = suggestion
                    
                } label: {
                    
                    HStack {
                        
                        Text(suggestion)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.up.right")
                        
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                }
                .buttonStyle(.plain)
                
            }
            
        }
        
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChatView()
        }
    }
}
