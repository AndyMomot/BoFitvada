//
//  WorkoutView.swift
//  BoFitvada
//
//  Created by Andrii Momot on 11.02.2025.
//

import SwiftUI

struct WorkoutView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Asset.preloaderBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    WorkoutView()
}
