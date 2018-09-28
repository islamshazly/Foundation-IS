//
//  DateFormatterExtension.swift
//  Ostazi Profile
//
//  Created by Islam Elshazly on 4/14/18.
//

import Foundation

public extension DateFormatter {
    
    public static func dateFromFormat(_ formate: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        dateFormatter.locale = Locale.current
    }
}



