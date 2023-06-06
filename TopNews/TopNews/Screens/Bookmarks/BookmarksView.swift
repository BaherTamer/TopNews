//
//  BookmarksView.swift
//  TopNews
//
//  Created by Baher Tamer on 06/06/2023.
//

import SwiftUI

struct BookmarksView: View {
    
    @EnvironmentObject var bookmarkModel: BookmarkModel
    
    var body: some View {
        NavigationView {
            self.bookmarksPhase()
                .navigationTitle("Bookmarks")
        }
    }
    
    @ViewBuilder
    private func bookmarksPhase() -> some View {
        if self.bookmarkModel.bookmarks.isEmpty {
            PlaceholderView(text: "No Bookmarks", systemImage: "bookmark.fill")
        } else {
            ArticleListView(articles: self.bookmarkModel.bookmarks, showCategoryPicker: false)
        }
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
            .environmentObject(BookmarkModel.shared)
    }
}
