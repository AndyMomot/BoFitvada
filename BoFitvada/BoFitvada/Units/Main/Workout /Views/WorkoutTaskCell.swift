//
//  WorkoutTaskCell.swift
//  BoFitvada
//
//  Created by Andrii Momot on 12.02.2025.
//

import SwiftUI

struct WorkoutTaskCell: View {
    let item: WorkoutTask
    var action: (ViewAction) -> Void
    
    @State private var showDescription = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 20) {
                Button {
                    action(.update(item: item))
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
            .padding(.vertical)
            .padding(.trailing)
            .foregroundStyle(.white)
            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 20))
            
            if let description = item.description, !description.isEmpty {
                
                if showDescription {
                    Text(description)
                        .foregroundStyle(.white)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
                showDescriptionButton
            }
        }
        .background(.black.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay {
            if item.isCustom {
                deleteButton
            }
        }
    }
}

extension WorkoutTaskCell {
    enum ViewAction {
        case update(item: WorkoutTask)
        case delete(id: String)
    }
}

private extension WorkoutTaskCell {
    var deleteButton: some View {
        HStack {
            Spacer()
            VStack {
                Button {
                    action(.delete(id: item.id))
                } label: {
                    Image(systemName: "trash")
                        .foregroundStyle(.white)
                        .offset(x: 5, y: -5)
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
        }
    }
    
    var showDescriptionButton: some View {
        Button {
            withAnimation(.bouncy) {
                showDescription.toggle()
            }
        } label: {
            HStack {
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundStyle(.white)
                    .rotationEffect(.degrees(showDescription ? 180 : 0))
                    .padding(.bottom, 4)
                Spacer()
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        Asset.preloaderBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        VStack(spacing: 30) {
            WorkoutTaskCell(item: .init(
                id: "1",
                name: "Lift a total of 500 kg (1100 lbs) in a single workout session",
                score: 10,
                type: .power
            )) {_ in}
            
            WorkoutTaskCell(item: .init(
                id: "1",
                name: "Lift a total of 500 kg",
                score: 10,
                type: .power,
                isFinished: true
            )) {_ in}
            
            WorkoutTaskCell(item: .init(
                id: "1",
                name: "Lift a total of 500 kg",
                score: 10,
                type: .power,
                description: "Lift a total of 500 kg (1100 lbs) in a single workout session Lift a total of 500 kg (1100 lbs) in a single workout session",
                isFinished: true,
                isCustom: true
            )) {_ in}
        }
        .padding()
    }
}
