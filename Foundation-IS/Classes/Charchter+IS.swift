//
//  Charchter+AG.swift
//  AG-Foundation
//
//  Created by islam Elshazly on 8/28/18.
//

import Foundation

public extension Character {
    
    public var isEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        let scalarValue = String(self).unicodeScalars.first!.value
        switch scalarValue {
        case 0x3030, 0x00AE, 0x00A9, // Special Characters
        0x1D000...0x1F77F, // Emoticons
        0x2100...0x27BF, // Misc symbols and Dingbats
        0xFE00...0xFE0F, // Variation Selectors
        0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
            
            return true
        default:
            
            return false
        }
    }
    public var isNumber: Bool {
        return Int(String(self)) != nil
    }
    public var isLetter: Bool {
        return String(self).rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }
    public var isLowercased: Bool {
        return String(self) == String(self).lowercased()
    }
    public var isUppercased: Bool {
        return String(self) == String(self).uppercased()
    }
    public var isWhiteSpace: Bool {
        return self == " "
    }
    public var lowercased: Character {
        return String(self).lowercased().first!
    }
    public var uppercased: Character {
        return String(self).uppercased().first!
    }
    
}
