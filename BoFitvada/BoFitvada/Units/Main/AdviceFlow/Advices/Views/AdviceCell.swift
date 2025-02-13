//
//  AdviceCell.swift
//  BoFitvada
//
//  Created by Andrii Momot on 13.02.2025.
//

import SwiftUI

struct AdviceCell: View {
    let item: AdviceModel
    var onRead: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
            
            HStack {
                Text(item.title)
                    .foregroundStyle(.white)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                Spacer()
                
                NextButton(title: "READ") {
                    onRead()
                }
                .allowsHitTesting(false)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 24)
            .background(.black.opacity(0.75))
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    ZStack {
        Asset.preloaderBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        AdviceCell(item: .init(
            imageName: Asset.dumbbellWorkouts.name,
            secondImageName: Asset.dumbbellWorkouts.name,
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
        )) {}
        .padding()
    }
}
