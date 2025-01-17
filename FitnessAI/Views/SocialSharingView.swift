import SwiftUI

struct SocialSharingView: View {
    @State private var posts: [Post] = [
        Post(user: "John", content: "Ran 5km today! Feeling great! 😊", likes: 3),
        Post(user: "Alice", content: "Completed a 30-minute HIIT session! 💪", likes: 5)
    ]

    var body: some View {
        VStack {
            Text("Community Feed")
                .font(.largeTitle)
                .bold()
                .padding()

            List(posts) { post in
                VStack(alignment: .leading) {
                    Text(post.user)
                        .font(.headline)
                        .foregroundColor(.yellow)
                    Text(post.content)
                        .foregroundColor(.white)
                    HStack {
                        Button(action: {
                            likePost(post: post)
                        }) {
                            HStack {
                                Image(systemName: "hand.thumbsup.fill")
                                Text("\(post.likes)")
                            }
                            .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                }
            }
            .listRowBackground(Color.black)
        }
        .background(Color.black)
    }

    func likePost(post: Post) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].likes += 1
        }
    }
}
