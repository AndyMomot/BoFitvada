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
        NavigationStack {
            ZStack {
                Asset.preloaderBg.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 35) {
                    NavigationBarTitle(text: "WORKOUT")
                    
                    GoalPicker(workoutType: $viewModel.workoutType)
                    
                    HStack {
                        Text("STATUS")
                        Spacer()
                        Text("SCORES")
                    }
                    .foregroundStyle(.white)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                    
                    ScrollView {
                        VStack(spacing: 30) {
                            ForEach(viewModel.completedWorkoutTasks) { item in
                                WorkoutTaskCell(item: item) { selection in
                                    Task {
                                        await viewModel.updateCompletionStatus(for: selection)
                                    }
                                }
                            }
                            
                            if !viewModel.completedWorkoutTasks.isEmpty {
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(.black.opacity(0.5))
                                    .frame(height: 2)
                            }
                            
                            ForEach(viewModel.uncompletedWorkoutTasks) { item in
                                WorkoutTaskCell(item: item) { selection in
                                    Task {
                                        await viewModel.updateCompletionStatus(for: selection)
                                    }
                                }
                            }
                        }
                    }
                    .scrollIndicators(.never)
                }
                .padding(.horizontal)
                .padding(.bottom, UIScreen.main.bounds.height * 0.1)
            }
            .onAppear {
                Task {
                    await viewModel.getCompletedWorkoutTasks()
                }
            }
        }
    }
}

#Preview {
    WorkoutView()
}
