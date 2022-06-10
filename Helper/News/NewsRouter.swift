//
//  NewsRouter.swift
//  Helper
//
//  Created by Andrey on 14.04.2022.
//

import Foundation
import UIKit

protocol NewsRouterProtocol {
    func showNewsDescriptionViewController(news: News)
}

class NewsRouter: NewsRouterProtocol {
   
    weak var moduleController: UIViewController?
    
    func showNewsDescriptionViewController(news: News) {
        let vc = NewsDescriptionAssembly().build(news: news)
        moduleController?.navigationController?.pushViewController(vc, animated: true)
    }
}
