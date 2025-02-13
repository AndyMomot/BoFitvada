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
        let staticWorkoutTasks = WorkoutTask.allTasks
        let customWorkoutTasks = DefaultsService.shared.customWorkoutTasks
        let allTasks = (staticWorkoutTasks + customWorkoutTasks).filter {
            $0.type == workoutType
        }.sorted(by: { $0.score < $1.score })
        
        let completedTasks = DefaultsService.shared.completedWorkoutTasks.filter {
            $0.type == workoutType
        }.sorted(by: { $0.score < $1.score })
        
        let uncompletedTasks = allTasks.filter { task in
            !completedTasks.contains(where: { $0.id == task.id })
        }
        
        await MainActor.run { [weak self] in
            self?.completedWorkoutTasks = completedTasks
            self?.uncompletedWorkoutTasks = uncompletedTasks
        }
    }
    
    func handleCell(action: WorkoutTaskCell.ViewAction) async {
        switch action {
        case .update(let item):
            await updateCompletionStatus(for: item)
        case .delete(let id):
            await deleteCustomWorkoutTask(id: id)
        }
        
        await getCompletedWorkoutTasks()
    }
    
    func updateCompletionStatus(for task: WorkoutTask) async {
        var newTask = task
        
        if newTask.isFinished {
            DefaultsService.shared.completedWorkoutTasks.removeAll(where: { $0.id == task.id })
        } else {
            newTask.isFinished.toggle()
            DefaultsService.shared.completedWorkoutTasks.append(newTask)
        }
    }
    
    func deleteCustomWorkoutTask(id: String) async {
        DefaultsService.shared.customWorkoutTasks.removeAll(where: { $0.id == id })
        DefaultsService.shared.completedWorkoutTasks.removeAll(where: { $0.id == id })
    }
}
