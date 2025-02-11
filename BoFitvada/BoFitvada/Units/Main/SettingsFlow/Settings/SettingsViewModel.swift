//
//  SettingsViewModel.swift
//  BoFitvada
//
//  Created by Andrii Momot on 11.02.2025.
//

import UIKit.UIImage

extension SettingsView {
    final class ViewModel: ObservableObject {
        @Published var image = Asset.camera.image {
            didSet {
                Task {
                    await saveImage()
                }
            }
        }
        @Published var showImagePicker = false
        @Published var nickname = "" {
            didSet {
                Task {
                    await saveNickname()
                }
            }
        }
        
        @Published var showFAQ = false
        @Published var showPrivacy = false
        
        let privacyURL = URL(string: "https://google.com")
        let appStoreURL = URL(string: "https://apps.apple.com/app/id6740994248")
    }
}

extension SettingsView.ViewModel {
    func getUser() async {
        let user = DefaultsService.shared.user
        await getImage(id: user.id)
        
        await MainActor.run { [weak self] in
            self?.nickname = user.name
        }
    }
    
    func getImage(id: String) async {
        guard let data = await FileManagerService().fetchImage(with: id),
              let image = UIImage(data: data)
        else { return }
        
        await MainActor.run { [weak self] in
            self?.image = image
        }
    }
    
    func saveImage() async {
        let user = DefaultsService.shared.user
        guard let data = image.pngData() else { return }
        FileManagerService().saveImage(data: data, for: user.id)
    }
    
    func saveNickname() async {
        DefaultsService.shared.user.name = nickname
    }
}
