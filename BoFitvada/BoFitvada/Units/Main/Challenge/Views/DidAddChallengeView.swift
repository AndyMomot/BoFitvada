//
//  DidAddChallengeView.swift
//  BoFitvada
//
//  Created by Andrii Momot on 13.02.2025.
//

import SwiftUI

struct DidAddChallengeView: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            Text("You have successfully created a new Challenge.")
                .foregroundStyle(.white)
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 20))
                .multilineTextAlignment(.center)
            
            NextButton(title: "OK") {
                withAnimation {
                    show = false
                }
            }
        }
        .padding(30)
        .background(.black.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    ZStack {
        Asset.preloaderBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        DidAddChallengeView(show: .constant(true))
    }
}
