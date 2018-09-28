//
//  Dictionary+AG.swift
//  AG-Foundation
//
//  Created by islam Elshazly on 8/29/18.
//

import Foundation

public extension Dictionary {
    
    public func has(_ key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    

}
