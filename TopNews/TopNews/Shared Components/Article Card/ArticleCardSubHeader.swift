//
//  ArticleCardSubHeader.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

struct ArticleCardSubHeader: View {
    
    let article: Article
    
    @EnvironmentObject var bookmarkModel: BookmarkModel
    
    var body: some View {
        HStack(spacing: 12) {
            authorSection
            
            HStack {
                Button {
                    withAnimation {
                        self.bookmarkModel.toggleBookmark(article: self.article)
                    }
                } label: {
                    Image(systemName: self.bookmarkModel.isBookmarked(article: self.article) ? "bookmark.fill" : "bookmark")
                        .cardButtonStyle()
                        .foregroundColor(self.bookmarkModel.isBookmarked(article: self.article) ? .primary : .secondary)
                }
                
                Button {
                    self.presentShareSheet(url: article.articleURL)
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .cardButtonStyle()
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
    
    var authorSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Author:")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(article.authorText)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct NewsCardSubHeader_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardSubHeader(article: Article.previewData[1])
            .environmentObject(BookmarkModel.shared)
    }
}
