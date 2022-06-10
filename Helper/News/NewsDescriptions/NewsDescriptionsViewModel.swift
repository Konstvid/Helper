//
//  NewsDescriptionsViewModel.swift
//  Helper
//
//  Created by Andrey on 28.04.2022.
//

import Foundation

protocol NewsDescriptionsViewModelProtocol {
    var news: News { get }
}

class NewsDescriptionsViewModel: NewsDescriptionsViewModelProtocol {
    
    let router: NewsDescriptionsRouterProtocol
    var news: News
    
    init(router: NewsDescriptionsRouterProtocol, news: News) {
        self.router = router
        self.news = news
    }
}
