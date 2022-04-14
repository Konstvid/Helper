//
//  NewsAssembly.swift
//  Helper
//
//  Created by Andrey on 31.01.2022.
//

import Foundation

class NewsAssembly {
    
    func build() -> NewsViewController {
        let router = NewsRouter()
        let viewModel = NewsViewModel(router: router)
        let vc = NewsViewController(viewModel: viewModel)
        return vc
    }
}
