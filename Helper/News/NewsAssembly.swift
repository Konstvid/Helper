//
//  NewsAssembly.swift
//  Helper
//
//  Created by Andrey on 31.01.2022.
//

import Foundation

class NewsAssembly: BaseAssembly {
    
    func build() -> NewsViewController {
        let router = NewsRouter()
        let viewModel = NewsViewModel(router: router, network: serviceFactory.network)
        let vc = NewsViewController(viewModel: viewModel)
        return vc
    }
}
