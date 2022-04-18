//
//  Constants.swift
//  Helper
//
//  Created by Andrey on 07.02.2022.
//

import Foundation

typealias VoidCompletion = (() -> Void)

struct Constants {
    
    static let news = "News"
    static let map = "Map"
    static let weather = "Weather"
    static let profile = "Profile"
    static let title = "Вы тута"
    static let subtitle = "Двигаемся:)"
    
    static let cityTitle = "City"
    static let temperatureTitle = "Temperature"
    static let cycloneTitle = "Cyclone"
    static let sunRiseTitle = "SunRise"
    static let sunSetTitle = "SunSet"
}
typealias ResultCompletion = (Result<Data, Error>) -> ()
typealias NewsCompletion = (Result<[News], Error>) -> ()


let baseNewsURL = "http://api.mediastack.com/v1/news?access_key="
let accessKey = "5d89270e214e44a5aa2594fb204f3f0f"

