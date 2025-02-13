//
//  CircularProgressBar.swift
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct CircularProgressBar: View {
    var progress: Double
    var bgColor: Color = .clear
    var trackColor: Color = .black
    var progressColor: Color = .yellow
    
    var lineWidth: CGFloat = 18
    var lineCap: CGLineCap = .butt
    
    var imageName: String?
    
    var text: String?
    var textColor: Color = .blue
    var textFont = Fonts.SFProDisplay.bold.swiftUIFont(size: 35)
    
    var description: String?
    var descriptionColor: Color = .blue
    var descriptionFont = Fonts.SFProDisplay.regular.swiftUIFont(size: 25)
    
    var body: some View {
        ZStack {
            Circle()
                .fill(bgColor)
            
            Circle()
                .stroke( // 1
                    trackColor,
                    lineWidth: lineWidth
                )
                .padding(lineWidth / 2)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke( // 1
                    progressColor,
                    style: .init(
                        lineWidth: lineWidth,
                        lineCap: lineCap
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
                .padding(lineWidth / 2)
            
            VStack(alignment: .center, spacing: 10) {
                if let imageName {
                    Image(imageName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(progressColor)
                        .frame(maxWidth: 50)
                }
                
                if let text {
                    Text(text)
                        .foregroundStyle(textColor)
                        .font(textFont)
                        .lineLimit(2)
                        .minimumScaleFactor(0.6)
                        .multilineTextAlignment(.center)
                }
                
                if let description {
                    Text(description)
                        .foregroundStyle(descriptionColor)
                        .font(descriptionFont)
                        .lineLimit(2)
                        .minimumScaleFactor(0.6)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .padding(lineWidth / 2)
    }
}

#Preview {
    CircularProgressBar(
        progress: 0.2,
        imageName: Asset.star.name,
        text: "75%",
        description: "7/10 tasks"
    )
}
