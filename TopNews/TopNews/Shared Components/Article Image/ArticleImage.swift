//
//  ArticleImage.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

struct ArticleImage: View {
    
    let imageURL: URL?
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .tint(.primary)
                        .offset(y: -60)
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                    
                case .failure:
                    Image(systemName: "photo")
                        .foregroundColor(.secondary)
                    
                @unknown default:
                    fatalError()
                }
            }
            .frame(width: size.width, height: size.height)
            .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 15))
        }
        .frame(height: 400)
    }
}

struct ArticleImage_Previews: PreviewProvider {
    static var previews: some View {
        ArticleImage(imageURL: nil)
    }
}
