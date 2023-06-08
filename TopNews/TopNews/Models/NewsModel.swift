//
//  NewsModel.swift
//  TopNews
//
//  Created by Baher Tamer on 04/06/2023.
//

import SwiftUI

struct FetchTaskToken: Equatable {
    var category: Category
    var token: Date
}

@MainActor
class NewsModel: ObservableObject {
    
    private let apiService = NewsAPI.shared
    
    @Published var articlesPhase = DataFetchPhase<[Article]>.empty
    @Published var fetchTaskToken: FetchTaskToken
    
    private let cache = DiskCache<[Article]>(filename: "articlesCache", expirationInterval: 3 * 60)
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        self.fetchTaskToken = FetchTaskToken(category: selectedCategory, token: .now)
        
        if let articles {
            self.articlesPhase = .success(articles)
        } else {
            self.articlesPhase = .empty
        }
        
        Task(priority: .userInitiated) {
            try? await cache.loadFromDisk()
        }
    }
    
    func refreshTask() async {
        await cache.removeValue(forKey: fetchTaskToken.category.rawValue)
        fetchTaskToken.token = Date()
    }
    
    func loadArticles() async {
        self.articlesPhase = .empty
        
        let category = fetchTaskToken.category
        if let articles = await cache.value(forKey: category.rawValue) {
            articlesPhase = .success(articles)
            
            return
        }
        
        if Task.isCancelled { return }
        
        do {
            let articles = try await self.apiService.fetch(from: self.fetchTaskToken.category)
            if Task.isCancelled { return }
            
            await cache.setValue(articles, forKey: category.rawValue)
            try? await cache.saveToDisk()
            
            self.articlesPhase = .success(articles)
        } catch {
            if Task.isCancelled { return }
            self.articlesPhase = .failure(error)
        }
    }
}
