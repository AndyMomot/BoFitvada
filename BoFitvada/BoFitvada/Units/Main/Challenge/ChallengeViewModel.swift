//
//  ChallengeViewModel.swift
//  BoFitvada
//
//  Created by Andrii Momot on 13.02.2025.
//

import Foundation

extension ChallengeView {
    final class ViewModel: ObservableObject {
        @Published var name = ""        { didSet { Task { await validate() }}}
        @Published var description = ""
        @Published var score = ""        { didSet { Task { await validate() }}}
        @Published var workoutType = WorkoutType.power
        
        @Published var isValid = false
        @Published var showSuccess = false
    }
}

extension ChallengeView.ViewModel {
    func validate() async {
        let isValid = !name.isEmpty
        && Int(score) != nil
        
        await MainActor.run { [weak self] in
            self?.isValid = isValid
        }
    }
    
    func save() async {
        let newItem = WorkoutTask(
            id: UUID().uuidString,
            name: name,
            score: Int(score) ?? .zero,
            type: workoutType,
            description: description,
            isCustom: true
        )
        
        DefaultsService.shared.customWorkoutTasks.append(newItem)
        await clear()
        
        await MainActor.run { [weak self] in
            self?.showSuccess = true
        }
    }
    
    func clear() async {
        await MainActor.run { [weak self] in
            guard let self else { return }
            self.name = ""
            self.description = ""
            self.score = ""
            self.workoutType = .power
        }
    }
}
