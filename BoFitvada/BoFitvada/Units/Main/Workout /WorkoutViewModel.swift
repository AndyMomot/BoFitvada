//
//  WorkoutViewModel.swift
//  BoFitvada
//
//  Created by Andrii Momot on 11.02.2025.
//

import Foundation

extension WorkoutView {
    final class ViewModel: ObservableObject {
        @Published var workoutType = WorkoutType.power {
            didSet {
                Task {
                    await getCompletedWorkoutTasks()
                }
            }
        }
        @Published var completedWorkoutTasks: [WorkoutTask] = []
        @Published var uncompletedWorkoutTasks: [WorkoutTask] = []
    }
}

extension WorkoutView.ViewModel {
    func getCompletedWorkoutTasks() async {
        let allUncompletedTasks = WorkoutTask.allTasks.filter {
            $0.type == workoutType
        }.sorted(by: { $0.score < $1.score })
        
        let completedTasks = DefaultsService.shared.completedWorkoutTasks.filter {
            $0.type == workoutType
        }.sorted(by: { $0.score < $1.score })
        
        let uncompletedTasks = allUncompletedTasks.filter { task in
            !completedTasks.contains(where: { $0.id == task.id })
        }
        
        await MainActor.run { [weak self] in
            self?.completedWorkoutTasks = completedTasks
            self?.uncompletedWorkoutTasks = uncompletedTasks
        }
    }
    
    func updateCompletionStatus(for task: WorkoutTask) async {
        var newTask = task
        
        if newTask.isFinished {
            DefaultsService.shared.completedWorkoutTasks.removeAll(where: { $0.id == task.id })
        } else {
            newTask.isFinished.toggle()
            DefaultsService.shared.completedWorkoutTasks.append(newTask)
        }
        
        await getCompletedWorkoutTasks()
    }
}
