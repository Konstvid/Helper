//
//  Constants.swift
//  Helper
//
//  Created by Andrey on 07.02.2022.
//

import Foundation

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
    static let profileTitle = "Profile"
}

typealias VoidCompletion = (() -> Void)
typealias ResultCompletion = (Result<Data, Error>) -> ()
typealias NewsCompletion = (Result<[News], Error>) -> ()
typealias WeatherCompletion = (Result<Weather, Error>) -> ()

let baseNewsURL = "http://api.mediastack.com/v1/news?access_key="
let accessKey = "5d89270e214e44a5aa2594fb204f3f0f"

let baseWeatherURL = "api.weatherbit.io/v.2/current?&city_name=Moscow&temp&pree&sunrise&sunset&key=accessKeyWeather"
let accessKeyWeather = "55ee53fd8c204db09b803110a93f8298"
