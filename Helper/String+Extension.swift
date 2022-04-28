//
//  String + Extension.swift
//  Helper
//
//  Created by Andrey on 09.05.2022.
//

import Foundation

extension String {
        
    var monthDayYear: String {
        convertFormat(fromFormat: dateFormat, toFormat: newsDateFormat)
    }
    
    private var dateFormat: String {
        "yyyy-MM-dd'T'HH:mm:ssZ"
    }
    
    private var newsDateFormat: String {
        "dd MMMM yyyy"
    }
    
    private func convertFormat(fromFormat: String, toFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = Date.timeZoneUTC
        formatter.dateFormat = fromFormat
        guard let dateOrigin = formatter.date(from: self) else { return "" }
        formatter.dateFormat = toFormat
        formatter.locale = Locale.current
        return formatter.string(from: dateOrigin)
    }
}
