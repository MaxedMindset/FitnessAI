struct Challenge: Identifiable {
    let id = UUID()
    let name: String
    var progress: Int
    let goal: Int
}