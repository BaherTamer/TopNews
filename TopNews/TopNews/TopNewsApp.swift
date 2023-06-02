//
//  TopNewsApp.swift
//  TopNews
//
//  Created by Baher Tamer on 01/06/2023.
//

import SwiftUI

@main
struct TopNewsApp: App {
    var body: some Scene {
        WindowGroup {
            ArticleListView(articles: Article.previewData)
                .background(Color(UIColor.systemGray6))
                .preferredColorScheme(.dark)
        }
    }
}
