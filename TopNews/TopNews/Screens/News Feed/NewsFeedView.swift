//
//  NewsFeedView.swift
//  TopNews
//
//  Created by Baher Tamer on 04/06/2023.
//

import SwiftUI

struct NewsFeedView: View {
    
    @StateObject private var newsModel = NewsModel()
    
    private var articles: [Article] {
        if case let .success(articles) = newsModel.articlesPhase {
            return articles
        } else {
            return []
        }
    }
    
    var body: some View {
        NavigationView {
            //ArticleListView(articles: self.articles)
            mainPhasesView
                .navigationTitle(self.newsModel.selectedCategory.rawValue.capitalized)
                .onAppear {
                    self.loadTask()
                }
                .refreshable {
                    self.loadTask()
                }
        }
    }
    
    @ViewBuilder
    var mainPhasesView: some View {
        switch self.newsModel.articlesPhase {
            
        case .empty:
            ProgressView()
            
        case .success(let articles) where articles.isEmpty:
            PlaceholderView(text: "No Articles", systemImage: "newspaper.fill")
            
        case .failure(let error):
            ErrorArticlesView(text: error.localizedDescription) {
                self.loadTask()
            }
            
        case .success(let articles):
            ArticleListView(articles: articles)
        }
    }
    
    private func loadTask() {
        Task {
            await self.newsModel.loadArticles()
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
