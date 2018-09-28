//
//  Bundle+AG.swift
//  AG-Foundation
//
//  Created by islam Elshazly on 8/29/18.
//

import Foundation
import Foundation

public extension Bundle {
    
    public static var appDisplayName: String? {
        if let bundleDisplayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return bundleDisplayName
        } else if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }
        
        return nil
    }
    
    public static var appVersionAndBuild: String? {
        if appVersion == appBuild {
            
            return "v\(appVersion!)"
        } else {
            
            return "v\(appVersion!)(\(appBuild!))"
        }
    }
    
    public static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    public static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    public static var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }
    
    public class func loadNib(_ name: String, owner: AnyObject!) {
        _ = Bundle.main.loadNibNamed(name, owner: owner, options: nil)?[0]
    }
    
    public static func loadNib<T>(_ name: String) -> T? {
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?[0] as? T
    }
    
}
