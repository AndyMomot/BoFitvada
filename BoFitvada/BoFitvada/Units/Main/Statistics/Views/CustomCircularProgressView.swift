//
//  CustomCircularProgressView.swift
//  BoFitvada
//
//  Created by Andrii Momot on 13.02.2025.
//

import SwiftUI

struct CustomCircularProgressView: View {
    let name: String
    var imageName: String?
    var progressTitle: String?
    var progressDescription: String?
    var progressColor: Color
    var progress: Double
    
    var body: some View {
        VStack(alignment: .center, spacing: 18) {
            Text(name)
                .foregroundStyle(.white)
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 24))
                .multilineTextAlignment(.center)
            
            CircularProgressBar(
                progress: progress,
                bgColor: .ashGray.opacity(0.25),
                trackColor: .clear,
                progressColor: progressColor,
                lineWidth: 22,
                lineCap: .round,
                imageName: imageName,
                text: progressTitle,
                textColor: .white,
                textFont: Fonts.SFProDisplay.bold.swiftUIFont(size: 24),
                description: progressDescription,
                descriptionColor: .white,
                descriptionFont: Fonts.SFProDisplay.regular.swiftUIFont(size: 16)
            )
        }
    }
}

#Preview {
    ZStack {
        Asset.preloaderBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        CustomCircularProgressView(
            name: "statistics on completed tasks".uppercased(),
            progressDescription: "7/10 tasks",
            progressColor: .redCustom,
            progress: 0.75
        )
        .padding(.horizontal, 100)
    }
}
