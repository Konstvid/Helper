//
//  WeatherViewModel.swift
//  Helper
//
//  Created by Andrey on 10.03.2022.
//

import Foundation


class WeatherViewModel {
    
    private let weatherRouter: WeatherRouter
    
    init(weatherRouter: WeatherRouter) {
        self.weatherRouter = weatherRouter
    }
}
