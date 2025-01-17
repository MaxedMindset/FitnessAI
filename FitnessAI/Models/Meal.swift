struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let instructions: String
    let calories: Int
    let vitamins: String
}