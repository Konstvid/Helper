//
//  New.swift
//  Helper
//
//  Created by Andrey on 21.04.2022.
//

import Foundation

struct NewsResponse: Codable {
   
    let data: [News]
}

struct News: Codable {
    
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let source: String?
    let image: String?
    let category: String?
    let language: String?
    let country: String?
    let publishedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case author, title, description, url, source, image, category, language, country
        case publishedAt = "published_at"
    }
}
