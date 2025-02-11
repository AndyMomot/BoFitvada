//
//  TabBarViewModel.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import Foundation
import SwiftUI

extension TabBar {
    final class ViewModel: ObservableObject {
        @Published var selection = TabBarSelectionView.workout.rawValue
        @Published var isShowTabBar = true
        
        func showTabBar(_ show: Bool) {
            DispatchQueue.main.async { [weak self] in
                self?.isShowTabBar = show
            }
        }
    }
}

extension TabBar {
    enum TabBarSelectionView: Int {
        case workout = 0
        case challenge
        case advice
        case stats
        case settings
    }
    
    struct Item: Identifiable {
        private(set) var id = UUID()
        var imageName: String
        var title: String
    }
}
