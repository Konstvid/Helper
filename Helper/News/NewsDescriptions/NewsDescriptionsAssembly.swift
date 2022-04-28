//
//  NewsDescriptionAssembly.swift
//  Helper
//
//  Created by Andrey on 28.04.2022.
//

import Foundation


class NewsDescriptionAssembly {
    
    func build(news: News) -> NewsDescriptionsViewController {
        let router = NewsDescriptionsRouter()
        let viewModel = NewsDescriptionsViewModel(router: router, news: news)
        let vc = NewsDescriptionsViewController(viewModel: viewModel)
        return vc
    }
}
