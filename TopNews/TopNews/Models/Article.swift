//
//  Article.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import Foundation

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct Article: Codable, Equatable {
    
    let source: Source
    
    let url: String
    let content: String
    let publishedAt: Date
    
    let title: String?
    let author: String?
    let urlToImage: String?
    
    var titleText: String {
        title ?? "No Title"
    }
    
    var authorText: String {
        author ?? "Unkown"
    }
    
    var publishedDate: String {
        relativeDateFormatter.localizedString(for: publishedAt, relativeTo: .now)
    }
    
    var articleURL: URL {
        URL(string: url)!
    }
    
    var imageURL: URL? {
        guard let urlToImage else {
            return nil
        }
        
        return URL(string: urlToImage)
    }
    
}

extension Article: Identifiable {
    
    var id: String { url }
    
}

extension Article {
    
    static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "News", withExtension: "json")!
        let data = try! Data(contentsOf: previewDataURL)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiResponse = try! jsonDecoder.decode(NewsAPIResponse.self, from: data)
        return apiResponse.articles ?? []
    }
    
}

struct Source: Codable, Equatable {
    let name: String
}
