//
//  EmoTextView.swift
//  EmoTextViewEx1
//
//  Created by jay on 22/07/25.
//

import SwiftUI
// not sure which one to use, since it requires device to run and validate!
import SystemLanguageModel
import LanguageModelSession

struct EmoTextView: View {
    @Binding var text: String
    var placeholder: String = ""
    
    @State private var detectedEmotion: String = "Unknown"
    @State private var emoticon: String = "😐"
    
    // Use Apple's Foundation Model
    @State private var session: LanguageModelSession? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .trailing) {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(borderColor(for: detectedEmotion), lineWidth: 2)
                    )
                    .onChange(of: text) { newText in
                        Task {
                            await updateEmotion(for: newText)
                        }
                    }
                Text(emoticon)
                    .padding(.trailing, 16)
            }
            Text(detectedEmotion)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .onAppear {
            let instructions = "Extract the emotion from the text given."
            session = LanguageModelSession(instructions: instructions)
        }
        .padding()
    }
    
    // MARK: - Helpers
    
    func updateEmotion(for input: String) async {
        guard let session else { return }
        do {
            let emotion = try await session.respond(to: input)
            // Postprocess as needed
            let trimmedEmotion = emotion.trimmingCharacters(in: .whitespacesAndNewlines)
            detectedEmotion = trimmedEmotion
            emoticon = emoticonForEmotion(trimmedEmotion)
        } catch {
            detectedEmotion = "Unknown"
            emoticon = "😐"
        }
    }
    
    func borderColor(for emotion: String) -> Color {
        switch emotion.lowercased() {
        case "happy", "joy", "excited", "positive":
            return .green
        case "anger", "angry", "frustrated", "negative":
            return .red
        case "sad", "disappointed":
            return .blue
        default:
            return .gray
        }
    }
    
    func emoticonForEmotion(_ emotion: String) -> String {
        switch emotion.lowercased() {
        case "happy", "joy", "excited", "positive":
            return "😊"
        case "anger", "angry", "frustrated", "negative":
            return "😠"
        case "sad", "disappointed":
            return "😢"
        default:
            return "😐"
        }
    }
}

// Usage Demo
struct EmoTextViewDemo: View {
    @State private var reviewText = ""
    var body: some View {
        EmoTextView(text: $reviewText, placeholder: "Type your message…")
    }
}

#Preview {
    EmoTextViewDemo()
}
