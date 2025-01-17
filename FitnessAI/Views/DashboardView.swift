//
//  DashboardView.swift
//  FitnessAI
//
//  Created by Kay Steinbauer on 17.01.25.
//


import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Welcome to Fitness AI")
                .font(.largeTitle)
                .bold()

            NavigationLink(destination: TrainingPlanView()) {
                DashboardTile(title: "Training Plan", icon: "figure.walk")
            }

            NavigationLink(destination: NutritionPlanView()) {
                DashboardTile(title: "Nutrition Plan", icon: "fork.knife")
            }

            NavigationLink(destination: ProgressPhotosView()) {
                DashboardTile(title: "Track Progress", icon: "camera")
            }
        }
        .padding()
    }
}

struct DashboardTile: View {
    let title: String
    let icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.largeTitle)
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
    }
}
