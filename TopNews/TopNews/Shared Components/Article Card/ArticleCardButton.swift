//
//  ArticleCardButton.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

struct ArticleCardButton: View {
    
    let type: CardButton
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: type.icon)
                .fontWeight(.bold)
                .padding(8)
                .foregroundColor(.secondary)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.ultraThickMaterial)
                }
        }
    }
}

struct NewsCardButton_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardButton(type: .share, action: {})
    }
}
