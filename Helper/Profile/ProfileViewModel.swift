//
//  ProfileViewModel.swift
//  Helper
//
//  Created by Andrey on 10.05.2022.
//

import Foundation

protocol ProfileViewModelProtocol {
    func getFields() -> [Field]
    func selectedOtherCell(data: Field)
    func makeAlertController()
}

class ProfileViewModel: ProfileViewModelProtocol {
    
    private let profileRouter: ProfileRouterProtocol
    
    init(profileRouter: ProfileRouterProtocol) {
        self.profileRouter = profileRouter
    }
    
    func getFields() -> [Field] {
        if let path = Bundle.main.path(forResource: "Profile", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: [])
                let profile = try JSONDecoder().decode(ProfileResponse.self, from: data)
                return profile.fields
            } catch {
                print("error")
            }
        }
        return []
    }
    
    func selectedOtherCell(data: Field) {
        profileRouter.selectedOtherCell(data: data)
    }
    
    func makeAlertController() {
        profileRouter.makeAlertController()
    }
}
