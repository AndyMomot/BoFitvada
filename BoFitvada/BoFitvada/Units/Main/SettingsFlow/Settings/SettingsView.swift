//
//  SettingsView.swift
//  BoFitvada
//
//  Created by Andrii Momot on 11.02.2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.preloaderBg.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    NavigationBarTitle(text: "SETTINGS")
                    
                    HStack(spacing: 22) {
                        Button {
                            viewModel.showImagePicker.toggle()
                        } label: {
                            if viewModel.image == Asset.camera.image {
                                Image(uiImage: viewModel.image)
                                    .padding(35)
                                    .background(.ashGray.opacity(0.6))
                                    .frame(width: 105, height: 105)
                                    .clipShape(Circle())
                            } else {
                                Image(uiImage: viewModel.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 105, height: 105)
                                    .clipShape(Circle())
                            }
                        
                        }
                        
                        CustomTextField(placeholder: "Nickname",
                                        showPencil: true,
                                        text: $viewModel.nickname)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 38) {
                        SettingsButton(text: "FAQ") {
                            viewModel.showFAQ.toggle()
                        }
                        
                        SettingsButton(text: "PRIACY") {
                            viewModel.showPrivacy.toggle()
                        }
                        
                        SettingsButton(text: "UPDATE APP") {
                            guard let url = viewModel.appStoreURL else { return }
                            UIApplication.shared.open(url)
                        }
                    }
                    .padding(.horizontal, 85)
                    .padding(.bottom, 85)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .onAppear {
                Task {
                    await viewModel.getUser()
                }
            }
            .sheet(isPresented: $viewModel.showImagePicker) {
                ImagePicker(selectedImage: $viewModel.image)
            }
            .sheet(isPresented: $viewModel.showPrivacy) {
                SwiftUIViewWebView(url: viewModel.privacyURL)
            }
            .navigationDestination(isPresented: $viewModel.showFAQ) {
                FAQView()
            }
        }
    }
}

#Preview {
    SettingsView()
}
