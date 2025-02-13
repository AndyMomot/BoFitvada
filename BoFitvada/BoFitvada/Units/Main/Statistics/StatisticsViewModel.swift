//
//  StatisticsViewModel.swift
//  BoFitvada
//
//  Created by Andrii Momot on 13.02.2025.
//

import Foundation

extension StatisticsView {
    final class ViewModel: ObservableObject {
        @Published var completedTasksCount = 0
        @Published var allTasksCount = 0
        @Published var taskProgressTitle = ""
        @Published var tasksProgressDescription = ""
        @Published var completedTasksPercent: Double = 0
        
        @Published var maxScore = 0
        @Published var currentScore = 0
        @Published var scoreProgressDescription = ""
        @Published var scorePercent: Double = 0
    }
}

extension StatisticsView.ViewModel {
    func getData() async {
        let allStaticTasks = WorkoutTask.allStaticTasks
        let allCustomTasks = DefaultsService.shared.customWorkoutTasks
        let allTasks = allStaticTasks + allCustomTasks
        
        let allTasksCount = allTasks.count
        let allCompletedTasksCount = DefaultsService.shared.completedWorkoutTasks.count
        
        let tasksProgressDescription = "\(allCompletedTasksCount)/\(allTasksCount) TASKS"
        let completedTasksPercent = Double(allCompletedTasksCount) / Double(allTasksCount)
        let taskProgressTitle = "\((completedTasksPercent * 100).string())%"
        
        let maxScore = allTasks.map { $0.score }.reduce(0) { $0 + $1 }
        let currentScore = DefaultsService.shared.completedWorkoutTasks.map { $0.score }.reduce(0) { $0 + $1 }
        let scorePercent = Double(currentScore) / Double(maxScore)
        
        await MainActor.run { [weak self] in
            guard let self else { return }
            self.completedTasksCount = allCompletedTasksCount
            self.allTasksCount = allTasksCount
            self.tasksProgressDescription = tasksProgressDescription
            self.completedTasksPercent = completedTasksPercent
            self.taskProgressTitle = taskProgressTitle
            
            self.maxScore = maxScore
            self.currentScore = currentScore
            self.scorePercent = scorePercent
        }
    }
}
