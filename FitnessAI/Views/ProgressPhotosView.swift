import SwiftUI

struct ProgressPhotosView: View {
    @State private var photos: [ProgressPhoto] = []

    var body: some View {
        VStack {
            Text("Progress Photos")
                .font(.largeTitle)
                .bold()
                .padding()

            ScrollView {
                ForEach(photos) { photo in
                    VStack {
                        Image(photo.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                            .padding()
                        Text("Taken on: \(photo.date)")
                    }
                }
            }
        }
        .padding()
    }
}

struct ProgressPhoto: Identifiable {
    let id = UUID()
    let imageName: String
    let date: String
}
