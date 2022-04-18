//
//  ServiceFactory.swift
//  Helper
//
//  Created by Andrey on 18.04.2022.
//

import Foundation

protocol ServiceFactoryProtocol {
    var defaults: UserDefaultServiceProtocol { get }
    var network: NetworkServiceProtocol { get }
}

class ServiceFactory: ServiceFactoryProtocol {
    
    static var shared = ServiceFactory()
    
    var defaults: UserDefaultServiceProtocol
    var network: NetworkServiceProtocol
    
    init() {
        defaults = UserDefaultService(defaults: UserDefaults.standard)
        network = NetworkService()
    }
}
