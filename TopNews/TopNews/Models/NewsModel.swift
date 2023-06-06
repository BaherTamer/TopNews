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
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        self.fetchTaskToken = FetchTaskToken(category: selectedCategory, token: .now)
        
        if let articles {
            self.articlesPhase = .success(articles)
        } else {
            self.articlesPhase = .empty
        }
    }
    
    func loadArticles() async {
        self.articlesPhase = .empty
        if Task.isCancelled { return }
        
        do {
            let articles = try await self.apiService.fetch(from: self.fetchTaskToken.category)
            if Task.isCancelled { return }
            self.articlesPhase = .success(articles)
        } catch {
            if Task.isCancelled { return }
            self.articlesPhase = .failure(error)
        }
    }
    
}
