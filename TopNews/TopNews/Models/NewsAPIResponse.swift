//
//  NewsAPIResponse.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import Foundation

struct NewsAPIResponse: Codable {
    
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
