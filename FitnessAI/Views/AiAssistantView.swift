import SwiftUI

struct AiAssistantView: View {
    @State private var userQuery: String = ""
    @State private var assistantResponse: String = "Welcome! Ask me anything about fitness, training, or nutrition."
    @State private var isLoading = false

    var body: some View {
        VStack {
            Text("AI Fitness Assistant")
                .font(.largeTitle)
                .bold()
                .padding()

            TextField("Type your question here...", text: $userQuery)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: generateResponse) {
                Text("Ask AI")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Text(assistantResponse)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
    }

    func generateResponse() {
        guard !userQuery.isEmpty else {
            assistantResponse = "Please type something to ask!"
            return
        }

        assistantResponse = "Fetching response for: \(userQuery)" // Placeholder logic
    }
}
