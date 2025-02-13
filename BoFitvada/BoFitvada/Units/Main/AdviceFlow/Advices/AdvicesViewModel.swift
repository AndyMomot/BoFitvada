//
//  AdvicesViewModel.swift
//  BoFitvada
//
//  Created by Andrii Momot on 13.02.2025.
//

import Foundation

extension AdvicesView {
    final class ViewModel: ObservableObject {
        let advices: [AdviceModel] = [
            .init(
                imageName: Asset.dumbbellWorkouts.name,
                secondImageName: Asset.dumbbellWorkouts2.name,
                title: "Dumbbell workouts",
                text: """
                To avoid injuries when training with dumbbells, follow these rules:
                
                1.  Warm up – prepare your muscles and joints before starting.
                2.  Proper technique – perform exercises smoothly and with control.
                3.  Choose the right weight – avoid overly heavy dumbbells, increase gradually.
                4.  Secure grip – hold the dumbbells firmly to prevent slipping.
                5.  Breathe evenly – don’t hold your breath, exhale on effort.
                6.  Avoid overtraining – rest between sets and don’t overload yourself.
                7.  Use a mirror – check your form and posture.
                8.  Finish with stretching – helps prevent soreness and injuries.
                """
            ),
            
                .init(
                    imageName: Asset.workoutOnGYM.name,
                    secondImageName: Asset.workoutOnGYM2.name,
                    title: "Workout on gym",
                    text: """
                    To avoid injuries when training on gym machines, follow these rules:
                    
                    1.  Warm up – prepare your muscles and joints before exercising.
                    2.  Adjust the machine – set the seat, backrest, and other settings to fit your body.
                    3.  Use proper technique – perform movements smoothly, without jerking.
                    4.  Choose the right weight – don’t overload, increase resistance gradually.
                    5.  Control your breathing – breathe evenly, don’t hold your breath.
                    6.  Balance your workout – train both sides of your body to avoid imbalances.
                    7.  Use safety features – if the machine has locks or supports, engage them.
                    """
                ),
            
                .init(
                    imageName: Asset.exerciseBikeWorkout.name,
                    secondImageName: Asset.exerciseBikeWorkout2.name,
                    title: "Exercise bike workout",
                    text: """
                    To avoid injuries when training on a stationary bike, follow these rules:
                    
                    1.  Warm up – prepare your muscles before starting your workout.
                    2.  Adjust the bike properly – set the seat height and handlebars to fit your body.
                    3.  Maintain good posture – keep your back straight, don’t hunch over.
                    4.  Use the right resistance – start with a comfortable level and increase gradually.
                    5.  Breathe evenly – take deep, steady breaths.
                    6.  Avoid knee strain – don’t set the resistance too high.
                    7.  Monitor your heart rate – maintain a steady pace without overexertion.
                    8.  Cool down and stretch – finish with light pedaling and muscle stretching.
                    """
                ),
        ]
    }
}

struct AdviceModel: Identifiable {
    private(set) var id = UUID().uuidString
    let imageName: String
    let secondImageName: String
    let title: String
    let text: String
}
