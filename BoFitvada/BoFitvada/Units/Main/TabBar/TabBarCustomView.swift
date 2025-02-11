//
//  TabBarCustomView.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import SwiftUI

struct TabBarCustomView: View {
    @Binding var selectedItem: Int
    
    private let items: [TabBar.Item] = [
        .init(imageName: Asset.tab1.name, title: "Workout"),
        .init(imageName: Asset.tab2.name, title: "Challenge"),
        .init(imageName: Asset.tab3.name, title: "Advice"),
        .init(imageName: Asset.tab4.name, title: "Stats"),
        .init(imageName: Asset.tab5.name, title: "Settings")
    ]
    
    private var arrange: [Int] {
        Array(0..<items.count)
    }
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.darkRed)
                .cornerRadius(50, corners: [.topLeft, .topRight])
            
            HStack(spacing: 0) {
                Spacer()
                ForEach(0..<items.count, id: \.self) { index in
                    let item = items[index]
                    let isSelected = selectedItem == index
                    
                    Button {
                        DispatchQueue.main.async {
                            withAnimation {
                                selectedItem = index
                            }
                        }
                    } label: {
                        VStack(spacing: 9) {
                            Image(item.imageName)
                                .renderingMode(.template)
                            
                            Text(item.title)
                                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 12))
                                .multilineTextAlignment(.center)
                                .padding(.bottom)
                        }
                        .foregroundStyle(isSelected ? .redCustom : .black)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    VStack {
        Spacer()
        TabBarCustomView(selectedItem: .constant(0))
            .frame(height: 105)
    }
}
