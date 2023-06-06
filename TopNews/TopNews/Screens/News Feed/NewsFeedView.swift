//
//  NewsFeedView.swift
//  TopNews
//
//  Created by Baher Tamer on 04/06/2023.
//

import SwiftUI

struct NewsFeedView: View {
    
    @EnvironmentObject var newsModel: NewsModel
    
    var body: some View {
        NavigationView {
            mainPhasesView
                .navigationTitle(self.newsModel.fetchTaskToken.category.rawValue.capitalized)
                .task(id: self.newsModel.fetchTaskToken, loadTask)
                .refreshable(action: refreshTask)
        }
    }
    
    @ViewBuilder
    var mainPhasesView: some View {
        switch self.newsModel.articlesPhase {
            
        case .empty:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(UIColor.systemGray6))
            
        case .success(let articles) where articles.isEmpty:
            PlaceholderView(text: "No Articles", systemImage: "newspaper.fill")
            
        case .failure(let error):
            ErrorArticlesView(text: error.localizedDescription, action: refreshTask)
            
        case .success(let articles):
            ArticleListView(articles: articles, showCategoryPicker: true)
        }
    }
    
    @Sendable
    private func loadTask() async {
        await self.newsModel.loadArticles()
    }
    
    @Sendable
    private func refreshTask() {
        Task {
            self.newsModel.fetchTaskToken = FetchTaskToken(category: self.newsModel.fetchTaskToken.category, token: .now)
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
            .environmentObject(NewsModel())
            .preferredColorScheme(.dark)
    }
}
