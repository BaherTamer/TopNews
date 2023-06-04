//
//  ArticleCardSubHeader.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

struct ArticleCardSubHeader: View {
    
    let article: Article
    
    var body: some View {
        HStack(spacing: 12) {
            authorSection
            
            HStack {
                ArticleCardButton(type: .bookmark) {
                    // TODO: Bookmark Logic
                }
                
                ArticleCardButton(type: .share) {
                    self.presentShareSheet(url: article.articleURL)
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
    }
}
