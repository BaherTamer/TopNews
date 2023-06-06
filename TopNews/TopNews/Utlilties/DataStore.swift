//
//  DataStore.swift
//  TopNews
//
//  Created by Baher Tamer on 06/06/2023.
//

import Foundation

protocol DataStore: Actor {
    
    associatedtype T
    
    func save(_ current: T)
    func load() -> T?
    
}

actor PlistDataStore<T: Codable>: DataStore where T: Equatable {
    
    private var saved: T?
    let filename: String
    
    private var dataURL: URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appending(path: "\(filename).plist")
    }
    
    init(filename: String) {
        self.filename = filename
    }
    
    func save(_ current: T) {
        if let saved, saved == current {
            return
        }
        
        do {
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .binary
            
            let data = try encoder.encode(current)
            try data.write(to: dataURL, options: [.atomic])
            
            saved = current
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> T? {
        do {
            let data = try Data(contentsOf: dataURL)
            let current = try PropertyListDecoder().decode(T.self, from: data)
            
            self.saved = current
            return current
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
