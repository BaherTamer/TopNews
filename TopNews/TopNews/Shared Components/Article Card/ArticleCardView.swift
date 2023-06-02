//
//  ArticleCardView.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

// MARK: - It might need @ViewBuilder
struct ArticleCardView: View {
    
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ArticleCardHeader(article: article)
            
            Divider()
                .background(.primary)
                .padding(.horizontal)
            
            ArticleCardSubHeader(article: article)
        }
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.black)
        }
    }
}

struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView(article: Article.previewData[1])
    }
}
