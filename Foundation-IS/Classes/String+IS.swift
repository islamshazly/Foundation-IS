//
//  StringExtensoin.swift
//  Twigano
//
//  Created by mac on 8/2/17.
//  Copyright © 2017  islam elshazly. All rights reserved.
//

import UIKit

public extension String {
    
    public var toLocale: Locale {
        return Locale(identifier: self)
    }
    
    public var base64Decoded: String? {
        // https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }
    
    public var base64Encoded: String? {
        // https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    
    public var toNSString: NSString { return self as NSString }

    public var camelCased: String {
        let source = lowercased()
        let first = source[..<source.index(after: source.startIndex)]
        if source.contains(" ") {
            let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
            let camel = connected.replacingOccurrences(of: "\n", with: "")
            let rest = String(camel.dropFirst())
            return first + rest
        }
        let rest = String(source.dropFirst())
        
        return first + rest
    }
    
    public var countofWords: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+", options: NSRegularExpression.Options())
        return regex?.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: self.count)) ?? 0
    }
    
    public var countofParagraphs: Int {
        let regex = try? NSRegularExpression(pattern: "\\n", options: NSRegularExpression.Options())
        let str = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        return (regex?.numberOfMatches(in: str, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: str.count)) ?? -1) + 1
    }
    
    public var hasLetters: Bool {
        return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }
    
    public var isBlank: Bool {
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        
        return trimmed.isEmpty
    }
    
    public var isValidEmail: Bool {
        // http://emailregex.com/
        let regex = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    public var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public mutating func capitalizeFirst() {
        guard self.count > 0 else { return }
        self.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).capitalized)
    }
    
    public mutating func lowercaseFirst() {
        guard self.count > 0 else { return }
        self.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).lowercased())
    }
    
    public func split(_ separator: String) -> [String] {
        return self.components(separatedBy: separator).filter {
            !$0.trimmed.isEmpty
        }
    }
    
    public func toInt() -> Int? {
        
        guard let num = NumberFormatter().number(from: self) else {
            return nil
        }
        
        return num.intValue
    }
    
    public func toDouble() -> Double? {

        guard let num = NumberFormatter().number(from: self) else {
            return nil
        }
        
        return num.doubleValue
    }
    
    public func toFloat() -> Float? {
        guard let num = NumberFormatter().number(from: self) else {
            return nil
        }
        
        return num.floatValue
    }
    
    public func toBool() -> Bool? {
        let trimmedString = trimmed.lowercased()
        if trimmedString == "true" || trimmedString == "false" {
            return (trimmedString as NSString).boolValue
        }
        
        return nil
    }
    
    public func underline() -> NSAttributedString {
        let underlineString = NSAttributedString(string: self, attributes: [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        
        return underlineString
    }
    
    public func bold(withFont font: UIFont) -> NSAttributedString {
        let boldString = NSMutableAttributedString(string: self, attributes: [NSAttributedStringKey.font: font])
        
        return boldString
    }
    
    public func italic(withFont font: UIFont) -> NSAttributedString {
        let italicString = NSMutableAttributedString(string: self, attributes: [NSAttributedStringKey.font: font])
        
        return italicString
    }
    
    public func color(_ color: UIColor) -> NSAttributedString {
        let colorString = NSMutableAttributedString(string: self, attributes: [NSAttributedStringKey.foregroundColor: color])
        return colorString
    }
    
    public func colorSubString(_ subString: String, color: UIColor) -> NSMutableAttributedString {
        var start = 0
        var ranges: [NSRange] = []
        while true {
            let range = (self as NSString).range(of: subString, options: NSString.CompareOptions.literal, range: NSRange(location: start, length: (self as NSString).length - start))
            if range.location == NSNotFound {
                break
            } else {
                ranges.append(range)
                start = range.location + range.length
            }
        }
        let attrText = NSMutableAttributedString(string: self)
        for range in ranges {
            attrText.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
        }
        
        return attrText
    }
}



