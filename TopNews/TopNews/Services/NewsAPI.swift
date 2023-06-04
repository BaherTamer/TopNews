//
//  NewsAPI.swift
//  TopNews
//
//  Created by Baher Tamer on 04/06/2023.
//

import Foundation

struct NewsAPI {
    
    static let shared = NewsAPI()
    private init() {}
    
    private let apiKey = API.key
    
    func fetch(from category: Category) async throws -> [Article] {
        try await self.fetchArticles(from: self.getNewsURL(from: category))
    }
    
    private func fetchArticles(from url: URL) async throws -> [Article] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw self.generateError(description: "DEBUG: Bad Response!")
        }
        
        switch response.statusCode {
            
        case (200...299), (400...499):
            return try await self.getAPIResponse(from: data)
        default:
            throw self.generateError(description: "DEBUG: Server Error!")
            
        }
    }
    
    private func getAPIResponse(from data: Data) async throws -> [Article] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiResponse = try jsonDecoder.decode(NewsAPIResponse.self, from: data)
        
        if apiResponse.status == "ok" {
            return apiResponse.articles ?? []
        } else {
            throw self.generateError(description: "DEBUG: \(apiResponse.message ?? "API Response Error!")")
        }
    }
    
    private func getNewsURL(from category: Category) -> URL {
        var url = "https://newsapi.org/v2/top-headlines?"
        
        url += "&apikey=\(apiKey)"
        url += "&language=en"
        url += "&category=\(category.rawValue)"
        
        return URL(string: url)!
    }
}

// MARK: - Helpers

extension NewsAPI {
    
    private func generateError(code: Int = 1, description: String) -> Error {
        NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
    
}
