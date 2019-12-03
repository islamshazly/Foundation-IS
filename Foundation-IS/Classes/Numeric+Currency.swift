//
//  FloatExtension.swift
//  AG-Foundation
//
//  Created by islam Elshazly on 8/16/18.
//

import Foundation

extension Numeric {
    
    public func formattedAmount(numberStyle: NumberFormatter.Style = .currency, maximumFationDigts: Int = 2 ) -> String? {
        guard let number = self as? NSNumber else {
            return nil
        }
        
        let formater = NumberFormatter()
        formater.locale = Locale.current
        formater.numberStyle = numberStyle
        formater.maximumFractionDigits = maximumFationDigts
        let formatedSting = formater.string(from: number)
        
        return formatedSting ?? nil
    }
}
