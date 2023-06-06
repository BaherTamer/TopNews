//
//  View+Extensions.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

extension View {
    func safeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}

extension View {
    func presentShareSheet(url: URL) {
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        if let windowScene =  UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.keyWindow?.rootViewController?.present(activityViewController, animated: true)
        }
    }
}

extension View {
    func cardButtonStyle() -> some View {
        modifier(CardButtonStyle())
    }
}

struct CardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .padding(8)
            //.foregroundColor(.secondary)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThickMaterial)
            }
    }
}

extension View {
    func articleHeaderButtonStyle() -> some View {
        modifier(ArticleHeaderButtonStyle())
    }
}

struct ArticleHeaderButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.black)
            .padding(10)
            .background(.white)
            .clipShape(Circle())
    }
}
