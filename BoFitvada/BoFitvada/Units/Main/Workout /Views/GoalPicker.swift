//
//  GoalPicker.swift
//  BoFitvada
//
//  Created by Andrii Momot on 12.02.2025.
//

import SwiftUI

struct GoalPicker: View {
    @Binding var workoutType: WorkoutType
    private let list = WorkoutType.allCases
    
    var body: some View {
        HStack(spacing: 50) {
            Text("GOAL")
                .foregroundStyle(.white)
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
            
            Spacer()
            
            Menu {
                ForEach(list, id: \.rawValue) { item in
                    Button {
                        workoutType = item
                    } label: {
                        Text(item.rawValue)
                    }
                }
            } label: {
                HStack {
                    Image(systemName: "arrowtriangle.down.fill")
                        .hidden()
                    
                    Spacer()
                    Text(workoutType.rawValue)
                    Spacer()
                    
                    Image(systemName: "arrowtriangle.down.fill")
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .foregroundStyle(.white)
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
            }
        }
    }
}

#Preview {
    ZStack {
        Asset.preloaderBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        GoalPicker(workoutType: .constant(.power))
            .padding()
    }
}
