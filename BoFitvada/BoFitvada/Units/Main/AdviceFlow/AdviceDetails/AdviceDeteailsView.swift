//
//  AdviceDetailsView.swift
//  BoFitvada
//
//  Created by Andrii Momot on 13.02.2025.
//

import SwiftUI

struct AdviceDetailsView: View {
    let item: AdviceModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Asset.preloaderBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image(item.secondImageName)
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack(spacing: 35) {
                HStack {
                    Spacer()
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.redCustom)
                            .frame(width: 30)
                    }

                }
                
                ScrollView {
                    VStack(spacing: 35) {
                        Text(item.title.uppercased())
                            .foregroundStyle(.white)
                            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 32))
                            .multilineTextAlignment(.center)
                        
                        Text(item.text)
                            .foregroundStyle(.white)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                            .lineSpacing(4)
                    }
                    .padding(.vertical, UIScreen.main.bounds.height * 0.1)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    AdviceDetailsView(item: .init(
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
    ))
}
