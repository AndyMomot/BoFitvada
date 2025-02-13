//
//  ChallengeView.swift
//  BoFitvada
//
//  Created by Andrii Momot on 13.02.2025.
//

import SwiftUI

struct ChallengeView: View {
    @EnvironmentObject private var tabBarViewModel: TabBar.ViewModel
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Asset.preloaderBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 35) {
                NavigationBarTitle(text: "CHALLENGE")
                
                ScrollView {
                    VStack(spacing: 35) {
                        HStack {
                            Text("ADD TASKS")
                                .foregroundStyle(.white)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                            Spacer()
                            CustomTextField(placeholder: "Title",
                                            showPencil: true,
                                            text: $viewModel.name)
                        }
                        
                        VStack(spacing: 16) {
                            Text("TASK DESCRIPTION")
                                .foregroundStyle(.white)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                            
                            CustomTextField(placeholder: "Enter text (optional)",
                                            isDynamic: true,
                                            showPencil: true,
                                            text: $viewModel.description)
                            .frame(minHeight: UIScreen.main.bounds.height * 0.3)
                        }
                        
                        HStack {
                            Text("SCORES")
                                .foregroundStyle(.white)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                            Spacer()
                            CustomTextField(placeholder: "Enter quantity",
                                            showPencil: true,
                                            text: $viewModel.score,
                                            keyboardType: .numberPad)
                        }
                        
                        GoalPicker(workoutType: $viewModel.workoutType)
                        
                        NextButton(title: "SAVE") {
                            Task {
                                await viewModel.save()
                            }
                        }
                        .disabled(!viewModel.isValid)
                    }
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                }
                .scrollIndicators(.never)
            }
            .padding(.horizontal)
            
            if viewModel.showSuccess {
                DidAddChallengeView(show: $viewModel.showSuccess)
            }
        }
        .hideKeyboardWhenTappedAround()
    }
}

#Preview {
    ChallengeView()
}
