import SwiftUI

struct FriendsView: View {
    @State private var friends: [Friend] = []
    @State private var friendName: String = ""

    var body: some View {
        VStack {
            Text("Friends")
                .font(.largeTitle)
                .bold()
                .padding()

            HStack {
                TextField("Add Friend", text: $friendName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: addFriend) {
                    Text("Add")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }

            List(friends) { friend in
                Text(friend.name)
            }
        }
        .padding()
    }

    func addFriend() {
        guard !friendName.isEmpty else { return }
        friends.append(Friend(name: friendName))
        friendName = ""
    }
}