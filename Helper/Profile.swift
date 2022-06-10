//
//  Profile.swift
//  Helper
//
//  Created by Andrey on 17.05.2022.
//

import Foundation

struct ProfileResponse: Codable {
    let fields: [Field]
}

struct Field: Codable {
    let icon: String?
    let title: String?
    let arrow: Bool?
    let type: FieldType?
}

enum FieldType: String, Codable {
    case city, name, temperature, birthdate, notification
}
