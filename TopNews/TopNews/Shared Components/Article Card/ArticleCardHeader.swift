//
//  ArticleCardHeader.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

struct ArticleCardHeader: View {
    
    let article: Article
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            ArticleImage(imageURL: article.imageURL)
            
            overlaryGradient
            
            VStack(alignment: .leading, spacing: 10) {
                headerSource
                headerTitle
            }
            .foregroundColor(.primary)
            .padding()
        }
    }
    
    var overlaryGradient: LinearGradient {
        LinearGradient(colors: [
            .black,
            .black.opacity(0.75),
            .clear
        ], startPoint: .bottom, endPoint: .top)
    }
    
    var headerSource: some View {
        Label(article.source.name, systemImage: "newspaper.fill")
            .font(.callout)
            .fontWeight(.semibold)
    }
    
    var headerTitle: some View {
        Text(article.titleText)
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
    }
}

struct NewsCardHeader_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardHeader(article: Article.previewData[1])
    }
}
