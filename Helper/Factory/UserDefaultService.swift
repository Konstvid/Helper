//
//  UserDefaultService.swift
//  Helper
//
//  Created by Andrey on 18.04.2022.
//

import Foundation

protocol UserDefaultServiceProtocol {
    
}

class UserDefaultService: UserDefaultServiceProtocol {
    
    private var defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
}
