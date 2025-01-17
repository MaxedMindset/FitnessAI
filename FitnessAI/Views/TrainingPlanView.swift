import SwiftUI

struct TrainingPlanView: View {
    @State private var weeklyPlan: [[String]] = []
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    var body: some View {
        VStack {
            Text("Weekly Training Plan")
                .font(.title2)
                .bold()
                .padding()

            Button(action: generateWeeklyPlan) {
                Text("Generate Weekly Plan")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if !weeklyPlan.isEmpty {
                List(days.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(days[index])
                            .font(.headline)
                        ForEach(weeklyPlan[index], id: \.self) { item in
                            Text(item)
                        }
                    }
                }
            }
        }
        .padding()
    }

    func generateWeeklyPlan() {
        weeklyPlan = [
            ["Cardio (30 min)"],
            ["Upper Body Strength (4 sets x 10 reps)"],
            ["HIIT (20 min)"],
            ["Lower Body Strength (4 sets x 8 reps)"],
            ["Push Day: Chest & Shoulders"],
            ["Pull Day: Back & Biceps"],
            ["Active Recovery"]
        ]
    }
}
