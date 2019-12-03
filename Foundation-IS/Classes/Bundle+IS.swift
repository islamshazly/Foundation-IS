//
//  Bundle+AG.swift
//  AG-Foundation
//
//  Created by islam Elshazly on 8/29/18.
//

import Foundation
import Foundation

public extension Bundle {
    
    static var appDisplayName: String? {
        if let bundleDisplayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return bundleDisplayName
        } else if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }
        
        return nil
    }
    
    static var appVersionAndBuild: String? {
        if appVersion == appBuild {
            
            return "v\(appVersion!)"
        } else {
            
            return "v\(appVersion!)(\(appBuild!))"
        }
    }
    
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    static var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }
    
    class func loadNib(_ name: String, owner: AnyObject!) {
        _ = Bundle.main.loadNibNamed(name, owner: owner, options: nil)?[0]
    }
    
    static func loadNib<T>(_ name: String) -> T? {
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?[0] as? T
    }
    
}
