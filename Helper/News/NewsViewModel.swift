//
//  NewsViewModel.swift
//  Helper
//
//  Created by Andrey on 14.04.2022.
//

import Foundation

protocol NewsViewModelProtocol {
    func getNews(completion: @escaping ([News]) -> ())
    func showNewsDescriptions(news: News)
}

class NewsViewModel: NewsViewModelProtocol {
    
    let router: NewsRouterProtocol
    let network: NetworkServiceProtocol
    
    init(router: NewsRouterProtocol, network: NetworkServiceProtocol) {
        self.router = router
        self.network = network
    }
 
    func getNews(completion: @escaping ([News]) -> ()) {
        network.getNews { result in
            switch result {
            case .success(let news):
                completion(news)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showNewsDescriptions(news: News) {
        router.showNewsDescriptionViewController(news: news)
    }
}
