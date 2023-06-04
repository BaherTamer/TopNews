//
//  ArticleView.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

struct ArticleView: View {
    
    let article: Article
    
    @Binding var animateView: Bool
    @Binding var animateContent: Bool
    
    var onDismiss: () -> Void
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ArticleCardHeader(article: article)
                    .scaleEffect(self.animateView ? 1 : 0.93)
                
                VStack(spacing: 30) {
                    authorSection
                    
                    Divider()
                    
                    articleContent
                    
                    Divider()
                    
                    shareButton
                    
                }
                .padding()
                .opacity(self.animateContent ? 1 : 0)
                .scaleEffect(self.animateView ? 1 : 0.9, anchor: .top)
            }
        }
        .onAppear {
            withAnimation(.newsCardAnimation) {
                self.animateView = true
            }
            
            withAnimation(.newsCardAnimation.delay(0.05)) {
                self.animateContent = true
            }
        }
        .transition(.identity)
        .overlay(alignment: .top) {
            header
        }
        .statusBar(hidden: true)
        .ignoresSafeArea(.container, edges: .top)
        .background(Color(UIColor.systemGray6))
    }
    
    var header: some View {
        HStack {
            ArticleHeaderButton(type: .dismiss) {
                onDismiss()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ArticleHeaderButton(type: .bookmark) {
                // TODO: Bookmark
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal)
        .padding(.top, safeArea().top)
        .offset(y: -10)
        .opacity(self.animateView ? 1 : 0)
    }
    
    var authorSection: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Author:")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(article.authorText)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            Text(article.publishedDate)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
    
    var articleContent: some View {
        // The API unfortunately return content until 200 charcter max.
        ForEach(0 ..< 6) { _ in
            Text(article.content.prefix(197) + ".")
                .multilineTextAlignment(.leading)
        }
    }
    
    var shareButton: some View {
        Button {
            // TODO: Share Article Link
        } label: {
            Label("Share Article", systemImage: "square.and.arrow.up")
                .foregroundColor(.primary)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.ultraThickMaterial)
                }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.previewData[1], animateView: .constant(false), animateContent: .constant(false), onDismiss: {})
    }
}
