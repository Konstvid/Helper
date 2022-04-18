//
//  NewsViewModel.swift
//  Helper
//
//  Created by Andrey on 14.04.2022.
//

import Foundation

protocol NewsViewModelProtocol {
    
}

class NewsViewModel: NewsViewModelProtocol {
    
    let router: NewsRouterProtocol
    
    init(router: NewsRouterProtocol) {
        self.router = router
    }
}
