//
//  AdvicesView.swift
//  BoFitvada
//
//  Created by Andrii Momot on 13.02.2025.
//

import SwiftUI

struct AdvicesView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.preloaderBg.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 35) {
                    NavigationBarTitle(text: "ADVICE")
                    
                    ScrollView {
                        VStack(spacing: 35) {
                            ForEach(viewModel.advices) { advice in
                                NavigationLink {
                                    AdviceDetailsView(item: advice)
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    AdviceCell(item: advice) {}
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                    }
                    .scrollIndicators(.never)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    AdvicesView()
}
