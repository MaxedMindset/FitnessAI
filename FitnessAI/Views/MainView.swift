import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "house")
                }
                .tag(0)

            TrainingPlanView()
                .tabItem {
                    Label("Training Plan", systemImage: "figure.walk")
                }
                .tag(1)

            NutritionPlanView()
                .tabItem {
                    Label("Nutrition Plan", systemImage: "fork.knife")
                }
                .tag(2)

            ProgressPhotosView()
                .tabItem {
                    Label("Progress", systemImage: "camera")
                }
                .tag(3)

            FriendsView()
                .tabItem {
                    Label("Friends", systemImage: "person.3")
                }
                .tag(4)

            AiAssistantView()
                .tabItem {
                    Label("Assistant", systemImage: "brain")
                }
                .tag(5)
        }
    }
}
