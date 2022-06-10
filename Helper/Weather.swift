//
//  Weather.swift
//  Helper
//
//  Created by Andrey on 10.05.2022.
//

import Foundation

struct WeatherResponse: Codable {
    
    let weather: Weather
}

struct Weather: Codable {
    
    let city: String?
    let temperature: String?
    let cyclone: String?
    let sunrise: String?
    let sunset: String?
    
    enum CodingKeys: String, CodingKey {
        case city = "city_name"
        case temperature = "temp"
        case cyclone = "pres"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}
