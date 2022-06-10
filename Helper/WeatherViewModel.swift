//
//  WeatherViewModel.swift
//  Helper
//
//  Created by Andrey on 10.03.2022.
//

import Foundation

protocol WeatherViewModelProtocol {
    
}

class WeatherViewModel: WeatherViewModelProtocol {
    
    private let weatherRouter: WeatherRouterProtocol
    
    init(weatherRouter: WeatherRouterProtocol) {
        self.weatherRouter = weatherRouter
    }
}
