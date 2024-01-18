//
//  UserDefaultManager.swift
//  SeSAC4Network
//
//  Created by JinwooLee on 1/18/24.
//

import Foundation

// Singleton Pattern

class UserDefaultManager {
    
    static let shared = UserDefaultManager()
    
    enum UDKey : String {
        case source
        case target
    }
    
    let ud = UserDefaults.standard
    
    var source : String {
        get {
            ud.string(forKey: UDKey.source.rawValue) ?? "ko"
        }
        set {
            ud.set(newValue, forKey: UDKey.source.rawValue)
        }
    }
    
    var target : String {
        get {
            ud.string(forKey: UDKey.target.rawValue) ?? "ko"
        }
        set {
            ud.set(newValue, forKey: UDKey.target.rawValue)
        }
    }

}

