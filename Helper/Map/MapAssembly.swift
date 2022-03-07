//
//  MapAssembly.swift
//  Helper
//
//  Created by Andrey on 01.02.2022.
//

import Foundation

class MapAssembly {
    
    func build() -> MapViewController {
        let vc = MapViewController()
        let router = MapRouter()
        let viewModel = MapViewModel(mapRouter: router)
        vc.mapViewModel = viewModel
        return vc
    }
}
