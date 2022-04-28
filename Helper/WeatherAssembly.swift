//
//  WeatherAssembly.swift
//  Helper
//
//  Created by Andrey on 31.01.2022.
//

import Foundation

class WeatherAssembly: BaseAssembly {
    
    func build() -> WeatherVIewController {
        let vc = WeatherVIewController()
        return vc
    }
}
