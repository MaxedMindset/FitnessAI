import SwiftUI

struct NutritionPlanView: View {
    @State private var weeklyMeals: [[Meal]] = []
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    var body: some View {
        VStack {
            Text("Weekly Nutrition Plan")
                .font(.title2)
                .bold()
                .padding()

            Button(action: generateWeeklyMeals) {
                Text("Generate Weekly Plan")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if !weeklyMeals.isEmpty {
                List(days.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(days[index])
                            .font(.headline)
                        ForEach(weeklyMeals[index]) { meal in
                            VStack(alignment: .leading) {
                                Text(meal.name)
                                    .font(.headline)
                                Text(meal.instructions)
                                Text("Calories: \(meal.calories)")
                                Text("Vitamins: \(meal.vitamins)")
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }

    func generateWeeklyMeals() {
        weeklyMeals = [
            [
                Meal(name: "Grilled Chicken Salad", instructions: "Grill chicken, chop veggies.", calories: 350, vitamins: "A, C, K"),
                Meal(name: "Oatmeal", instructions: "Cook oats, add fruits.", calories: 300, vitamins: "B, Fiber")
            ],
            [
                Meal(name: "Avocado Toast", instructions: "Toast bread, mash avocado.", calories: 250, vitamins: "E, Potassium")
         
