//
//  PlaceholderView.swift
//  TopNews
//
//  Created by Baher Tamer on 04/06/2023.
//

import SwiftUI

struct PlaceholderView: View {
    
    let text: String
    let systemImage: String
    
    var body: some View {
        VStack {
            Image(systemName: systemImage)
                .font(.largeTitle)
                .imageScale(.large)
                .padding()
            
            Text(text)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemGray6))
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView(text: "No Bookmarks", systemImage: "bookmark")
    }
}
