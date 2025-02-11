//
//  SettingsButton.swift
//  BoFitvada
//
//  Created by Andrii Momot on 11.02.2025.
//

import SwiftUI

struct SettingsButton: View {
    let text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(.white)
                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 24))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(.ashGray.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ZStack {
        Asset.preloaderBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        SettingsButton(text: "FAQ") {}
            .padding()
    }
}
