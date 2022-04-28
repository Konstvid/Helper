//
//  WeatherAssembly.swift
//  Helper
//
//  Created by Andrey on 31.01.2022.
//

import Foundation

class WeatherAssembly: BaseAssembly {
    
    func build() -> WeatherVIewController {
        let router = WeatherRouter()
        let viewModel = WeatherViewModel(weatherRouter: router)
        let vc = WeatherVIewController(viewModel: viewModel)
        return vc
    }
}
