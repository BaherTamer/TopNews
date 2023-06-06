//
//  TopNewsApp.swift
//  TopNews
//
//  Created by Baher Tamer on 01/06/2023.
//

import SwiftUI

@main
struct TopNewsApp: App {
    
    @StateObject private var bookmarkModel = BookmarkModel.shared
    @StateObject private var newsModel = NewsModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bookmarkModel)
                .environmentObject(newsModel)
                .preferredColorScheme(.dark)
        }
    }
}
