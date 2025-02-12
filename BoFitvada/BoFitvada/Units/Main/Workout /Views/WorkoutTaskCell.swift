//
//  WorkoutTaskCell.swift
//  BoFitvada
//
//  Created by Andrii Momot on 12.02.2025.
//

import SwiftUI

struct WorkoutTaskCell: View {
    let item: WorkoutTask
    var onSelect: (WorkoutTask) -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Button {
                onSelect(item)
            } label: {
                ZStack {
                    Asset.checkBox.swiftUIImage
                    Asset.checkMark.swiftUIImage
                        .hidden(!item.isFinished)
                }
            }
            .buttonStyle(PlainButtonStyle())

            Text(item.name)
            
            Spacer()
            
            Text("\(item.score)")
        }
        .foregroundStyle(.white)
        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 20))
        .padding(.vertical)
        .padding(.trailing)
        .background(.black.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    ZStack {
        Asset.preloaderBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        VStack(spacing: 30) {
            WorkoutTaskCell(item: .init(
                id: 1,
                name: "Lift a total of 500 kg (1100 lbs) in a single workout session",
                score: 10,
                type: .power
            )) {_ in}
            
            WorkoutTaskCell(item: .init(
                id: 1,
                name: "Lift a total of 500 kg",
                score: 10,
                type: .power,
                isFinished: true
            )) {_ in}
        }
        .padding()
    }
}
