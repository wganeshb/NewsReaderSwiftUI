//
//  Constants.swift
//  NewsReaderSwiftUI
//
//  Created by Ganesh Balasaheb Waghmode on 17/08/24.
//

import Foundation

struct Constants {
    static let apiKey: String = "9487de15d7164662943625dc699837bc"
    static let baseURL: String = "https://newsapi.org/v2/top-headlines?country=us"
    static let placeholderImage: String = "https://placehold.jp/30/dd6699/ffffff/300x150.png?text=placeholder+image"
    static let placeholderDescription: String = "No content available"
    static let contentNotAvailable: String = "[Removed]"
    static let categories: [String] = ["Select Category", "business", "entertainment", "general", "health", "science", "sports", "technology"]
    static let categoryPlaceholder: String = "Select Category"
    static let topHeadlines: String = "Top Headlines"
    static let searchPlaceholderText: String = "Search text"
    static let landingPageURLString: String = "https://www.google.com"
    static let andCharacter = "&"
    static let equalToCharacter = "="
    static let categoryKeyString = "category"
    static let apiKeyString = "apiKey"
    
}

class QueryComponent {
    
    static func queryComponent(value: String) -> String {
        return Constants.andCharacter + Constants.categoryKeyString + Constants.equalToCharacter + value
    }
    
    static func apiKey() -> String {
        return Constants.andCharacter + Constants.apiKeyString + Constants.equalToCharacter + Constants.apiKey
    }
    
    static func defaultNewsURL() -> String {
        let urlString = URLEndpoint.defaultBaseUrl + QueryComponent.apiKey()
        return urlString
    }
    
    
    static func categorizedNewsURL(category: String) -> String {
        let urlString = URLEndpoint.baseUrlForCategory + QueryComponent.queryComponent(value: category) + QueryComponent.apiKey()
        return urlString
    }
    
}

struct URLEndpoint {
    static let baseUrlForCategory = "https://newsapi.org/v2/top-headlines?country=us"
    static let defaultBaseUrl = "https://newsapi.org/v2/everything?q=apple&from=2024-08-16&to=2024-08-16&sortBy=popularity"
}
