//
//  MapViewModel.swift
//  Helper
//
//  Created by Andrey on 07.03.2022.
//

import Foundation

protocol MapViewModalProtocol {
    
}

class MapViewModel: MapViewModalProtocol {
    
    private let mapRouter: MapRouterProtocol
    
    init(mapRouter: MapRouterProtocol) {
        self.mapRouter = mapRouter
    }
}
