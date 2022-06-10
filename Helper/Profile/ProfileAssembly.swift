//
//  ProfileAssembly.swift
//  Helper
//
//  Created by Andrey on 01.02.2022.
//

import Foundation

class ProfileAssembly: BaseAssembly {
    
    func build() -> ProfileViewController {
        let router = ProfileRouter()
        let viewModel = ProfileViewModel(profileRouter: router)
        let vc = ProfileViewController(viewModel: viewModel)
        router.moduleController = vc
        return vc
    }
}
