//
//  BookmarkModel.swift
//  TopNews
//
//  Created by Baher Tamer on 06/06/2023.
//

import SwiftUI

@MainActor
class BookmarkModel: ObservableObject {
    
    @Published private(set) var bookmarks: [Article] = []
    private let bookmarkStore = PlistDataStore<[Article]>(filename: "bookmarks")
    
    static let shared = BookmarkModel()
    
    private init() {
        self.loadBookmarks()
    }
    
    private func loadBookmarks() {
        Task {
            bookmarks = await self.bookmarkStore.load() ?? []
        }
    }
    
    func isBookmarked(article: Article) -> Bool {
        self.bookmarks.contains(where: {
            article.id == $0.id
        })
    }
    
    func toggleBookmark(article: Article) {
        if isBookmarked(article: article) {
            self.removeBookmark(article: article)
        } else {
            self.addBookmark(article: article)
        }
    }
    
    private func addBookmark(article: Article) {
        self.bookmarks.insert(article, at: 0)
        self.saveBookmarks()
    }
    
    private func removeBookmark(article: Article) {
        guard let index = self.bookmarks.firstIndex(where: {
            article.id == $0.id
        }) else {
            return
        }
        
        self.bookmarks.remove(at: index)
        self.saveBookmarks()
    }
    
    private func saveBookmarks() {
        let bookmarks = self.bookmarks
        
        Task {
            await self.bookmarkStore.save(bookmarks)
        }
    }
}
