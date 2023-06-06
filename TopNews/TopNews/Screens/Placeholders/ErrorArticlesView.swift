//
//  ErrorArticlesView.swift
//  TopNews
//
//  Created by Baher Tamer on 04/06/2023.
//

import SwiftUI

struct ErrorArticlesView: View {
    
    let text: String
    let action: () -> ()
    
    var body: some View {
        VStack {
            Text(text)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Button {
                action()
            } label: {
                Label("Retry", systemImage: "arrow.clockwise")
                    .labelStyle(.titleAndIcon)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemGray6))
    }
}

struct ErrorArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorArticlesView(text: "Error", action: {})
    }
}
