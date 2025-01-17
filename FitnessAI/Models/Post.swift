import Foundation

struct Post: Identifiable {
    let id = UUID()
    let user: String
    let content: String
    var likes: Int
}
