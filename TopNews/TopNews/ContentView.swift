//
//  ContentView.swift
//  TopNews
//
//  Created by Baher Tamer on 01/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsFeedView()
                .tabItem {
                    Label("News Feed", systemImage: "newspaper")
                }
            
            BookmarksView()
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
