//
//  ArticleShareButton.swift
//  TopNews
//
//  Created by Baher Tamer on 06/06/2023.
//

import SwiftUI

struct ArticleShareButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Label("Share Article", systemImage: "square.and.arrow.up")
                .foregroundColor(.primary)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.ultraThickMaterial)
                }
                .padding(.bottom)
        }
    }
}

struct ArticleShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ArticleShareButton(action: {})
    }
}
