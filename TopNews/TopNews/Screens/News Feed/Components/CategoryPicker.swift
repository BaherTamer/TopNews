//
//  CategoryPicker.swift
//  TopNews
//
//  Created by Baher Tamer on 06/06/2023.
//

import SwiftUI

struct CategoryPicker: View {
    
    @ObservedObject var newsModel: NewsModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Category.allCases) { category in
                    Button {
                        withAnimation {
                            self.newsModel.fetchTaskToken.category = category
                        }
                    } label: {
                        Text(category.rawValue.capitalized)
                            .font(.subheadline)
                            .fontWeight(self.newsModel.fetchTaskToken.category == category ? .semibold : .regular)
                            .padding(10)
                            .tint(self.newsModel.fetchTaskToken.category == category ? .black : .secondary)
                            .background(self.newsModel.fetchTaskToken.category == category ? Color.white : .secondary.opacity(0.25))
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct CategoryPicker_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPicker(newsModel: NewsModel())
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6))
            .preferredColorScheme(.dark)
    }
}
