//
//  ContentView.swift
//  AIInterviewAssistant
//
//  Created by Prit Kothadiya on 22/07/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var question = ""
    
    private let suggestions = [
        "Explain Dependency Injection",
        "What are Swift Actors?",
        "Explain MVVM with Example",
        "Difference between async let & Task"
    ]
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 0) {
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 28) {
                        
                        headerView
                        
                        suggestionSection
                        
                        emptyStateView
                        
                    }
                    .padding()
                    
                }
                
                Divider()
                
                inputBar
                
            }
            .navigationBarHidden(true)
            .background(Color(.systemGroupedBackground))
        }
    }
}
private extension ContentView {

    var inputBar: some View {

        HStack(spacing: 12) {

            TextField(
                "Ask anything about Swift...",
                text: $question
            )

            Button {

            } label: {

                Image(systemName: "mic.fill")
                    .font(.title3)

            }

            Button {

            } label: {

                Image(systemName: "paperplane.fill")
                    .font(.title3)

            }
            .disabled(question.isEmpty)

        }
        .padding()

        .background(Color(.systemBackground))

    }

}
private extension ContentView {

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
private extension ContentView {
    
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
private extension ContentView {
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
