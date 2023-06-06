//
//  ArticleListView.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

struct ArticleListView: View {
    
    @ObservedObject var newsModel: NewsModel
    
    @State private var selectedArticle: Article?
    @State private var isShowingArticleView: Bool = false
    @State private var animateView: Bool = false
    @State private var animateContent: Bool = false
    
    @Namespace var animation
    
    private var articles: [Article] {
        if case let .success(articles) = newsModel.articlesPhase {
            return articles
        } else {
            return []
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                CategoryPicker(newsModel: newsModel)
                
                ForEach(articles) { article in
                    Button {
                        withAnimation(.newsCardAnimation) {
                            self.selectedArticle = article
                            self.isShowingArticleView = true
                        }
                    } label: {
                        ArticleCardView(article: article)
                            .scaleEffect(self.selectedArticle?.id == article.id && self.isShowingArticleView ? 1 : 0.93)
                            .opacity(self.isShowingArticleView ? (self.selectedArticle?.id == article.id ? 1 : 0.75) : 1)
                    }
                    .buttonStyle(SelectedButtonStyle())
                }
            }
        }
        .background(Color(UIColor.systemGray6))
        .overlay {
            if let selectedArticle, isShowingArticleView {
                ArticleView(article: selectedArticle, animateView: $animateView, animateContent: $animateContent) {
                    withAnimation(.newsCardAnimation) {
                        self.animateView = false
                        self.animateContent = false
                        self.selectedArticle = nil
                        self.isShowingArticleView = false
                    }
                }
            }
        }
    }
}

struct NewsFeed_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(newsModel: NewsModel())
    }
}
