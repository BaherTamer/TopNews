//
//  ArticleHeaderButton.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

struct ArticleHeaderButton: View {
    
    let type: CardButton
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: type.icon)
                .font(.headline)
                .foregroundColor(.black)
                .padding(10)
                .background(.white)
                .clipShape(Circle())
        }
    }
}

struct ArticleHeaderButton_Previews: PreviewProvider {
    static var previews: some View {
        ArticleHeaderButton(type: .dismiss, action: {})
    }
}
