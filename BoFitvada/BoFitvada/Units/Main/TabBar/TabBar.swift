//
//  TabBar.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import SwiftUI

struct TabBar: View {
    @StateObject private var viewModel = ViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selection) {
                WorkoutView()
                    .tag(TabBarSelectionView.workout.rawValue)
                    .environmentObject(viewModel)
                
                ChallengeView()
                    .tag(TabBarSelectionView.challenge.rawValue)
                    .environmentObject(viewModel)
                
                AdvicesView()
                    .tag(TabBarSelectionView.advice.rawValue)
                    .environmentObject(viewModel)
                
                Text("stats")
                    .tag(TabBarSelectionView.stats.rawValue)
                
                SettingsView()
                    .tag(TabBarSelectionView.settings.rawValue)
                    .environmentObject(viewModel)
            }
            
            if viewModel.isShowTabBar {
                TabBarCustomView(selectedItem: $viewModel.selection)
                    .frame(height: UIScreen.main.bounds.height * 0.12)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    TabBar()
}
