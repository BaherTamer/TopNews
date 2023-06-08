//
//  Cache.swift
//  TopNews
//
//  Created by Baher Tamer on 08/06/2023.
//

import Foundation

protocol Cache: Actor {
    
    associatedtype V
    var expirationInterval: TimeInterval { get }
    
    func setValue(_ value: V?, forKey key: String)
    func value(forKey key: String) -> V?
    
    func removeValue(forKey key: String)
    func removeAllValues()
}
