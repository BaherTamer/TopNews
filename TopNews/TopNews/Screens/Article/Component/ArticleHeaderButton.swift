//
//  ArticleHeaderButton.swift
//  TopNews
//
//  Created by Baher Tamer on 06/06/2023.
//

import SwiftUI

struct ArticleHeaderButton: View {
    
    let alignment: Alignment
    let systemImage: String
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemImage)
                .articleHeaderButtonStyle()
        }
        .frame(maxWidth: .infinity, alignment: alignment)
    }
}

struct ArticleHeaderButton_Previews: PreviewProvider {
    static var previews: some View {
        ArticleHeaderButton(alignment: .leading, systemImage: "xmark.circle", action: {})
    }
}
