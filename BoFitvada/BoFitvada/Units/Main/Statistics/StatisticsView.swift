//
//  StatisticsView.swift
//  BoFitvada
//
//  Created by Andrii Momot on 13.02.2025.
//

import SwiftUI

struct StatisticsView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Asset.preloaderBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 35) {
                NavigationBarTitle(text: "STATS")
                
                ScrollView {
                    VStack(spacing: 35) {
                        CustomCircularProgressView(
                            name: "statistics on completed tasks".uppercased(),
                            progressTitle: viewModel.taskProgressTitle,
                            progressDescription: viewModel.tasksProgressDescription,
                            progressColor: .redCustom,
                            progress: viewModel.completedTasksPercent
                        )
                        
                        CustomCircularProgressView(
                            name: "statistics on points earned".uppercased(),
                            imageName: Asset.star.name,
                            progressTitle: "\(viewModel.currentScore)",
                            progressColor: .yellowCustom,
                            progress: viewModel.scorePercent
                        )
                    }
                    .padding(.horizontal, 50)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                }
                .scrollIndicators(.never)
            }
            .padding(.horizontal)
        }
        .onAppear {
            Task {
                await viewModel.getData()
            }
        }
    }
}

#Preview {
    StatisticsView()
}
