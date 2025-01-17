import SwiftUI

struct SettingsView: View {
    @State private var selectedLanguage = "English"
    let languages = ["English", "German", "Spanish"]

    var body: some View {
        Form {
            Section(header: Text("Account")) {
                NavigationLink(destination: Text("Profile Details")) {
                    Text("Profile")
                }
            }

            Section(header: Text("App Settings")) {
                Picker("Language", selection: $selectedLanguage) {
                    ForEach(languages, id: \.self) { language in
                        Text(language)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
        .navigationTitle("Settings")
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
