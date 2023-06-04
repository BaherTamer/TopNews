//
//  NewsModel.swift
//  TopNews
//
//  Created by Baher Tamer on 04/06/2023.
//

import SwiftUI

@MainActor
class NewsModel: ObservableObject {
    
    private let apiService = NewsAPI.shared
    
    @Published var articlesPhase = DataFetchPhase<[Article]>.empty
    @Published var selectedCategory: Category
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        self.selectedCategory = selectedCategory
        
        if let articles {
            self.articlesPhase = .success(articles)
        } else {
            self.articlesPhase = .empty
        }
    }
    
    func loadArticles() async {
        self.articlesPhase = .empty
        
        do {
            let articles = try await self.apiService.fetch(from: self.selectedCategory)
            self.articlesPhase = .success(articles)
        } catch {
            self.articlesPhase = .failure(error)
        }
    }
    
}
