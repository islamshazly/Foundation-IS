//
//  NSAttributedString+AG.swift
//  AG-Foundation
//
//  Created by islam Elshazly on 8/29/18.
//

import Foundation


// MARK: - Properties

public extension NSAttributedString {
    
    public var bolded: NSAttributedString {
        
        return applying(attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }

    public var underlined: NSAttributedString {
        return applying(attributes: [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
    }
    
    public var italicized: NSAttributedString {
        return applying(attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    public var striked: NSAttributedString {
        return applying(attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue as Int)])
    }
    
    public var attributes: [NSAttributedStringKey: Any] {
        return attributes(at: 0, effectiveRange: nil)
    }
    
    public func colored(with color: UIColor) -> NSAttributedString {
        return applying(attributes: [.foregroundColor: color])
    }
}

// MARK: - Methods

public extension NSAttributedString {

    fileprivate func applying(attributes: [NSAttributedStringKey: Any]) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        copy.addAttributes(attributes, range: range)
        
        return copy
    }
    
    /// Apply attributes to substrings matching a regular expression
    public func applying(attributes: [NSAttributedStringKey: Any], toRangesMatching pattern: String) -> NSAttributedString {
        guard let pattern = try? NSRegularExpression(pattern: pattern, options: []) else { return self }
        
        let matches = pattern.matches(in: string, options: [], range: NSRange(0..<length))
        let result = NSMutableAttributedString(attributedString: self)
        
        for match in matches {
            result.addAttributes(attributes, range: match.range)
        }
        
        return result
    }
    
    /// Apply attributes to occurrences of a given string
    public func applying<T: StringProtocol>(attributes: [NSAttributedStringKey: Any], toOccurrencesOf target: T) -> NSAttributedString {
        let pattern = "\\Q\(target)\\E"
        
        return applying(attributes: attributes, toRangesMatching: pattern)
    }
    
}

