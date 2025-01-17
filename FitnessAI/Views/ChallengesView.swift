import SwiftUI

struct ChallengesView: View {
    @State private var challenges: [Challenge] = [
        Challenge(name: "Run 10km", progress: 5, goal: 10),
        Challenge(name: "50 Push-ups Daily", progress: 3, goal: 7)
    ]

    var body: some View {
        VStack {
            Text("Challenges")
                .font(.largeTitle)
                .bold()
                .padding()

            List(challenges) { challenge in
                VStack(alignment: .leading) {
                    Text(challenge.name)
                        .font(.headline)
                        .foregroundColor(.green)
                    ProgressView(value: Double(challenge.progress) / Double(challenge.goal))
                        .padding()
                    Text("\(challenge.progress)/\(challenge.goal) Days Completed")
                        .foregroundColor(.white)
                }
            }
            .listRowBackground(Color.black)
        }
        .background(Color.black)
    }
}
