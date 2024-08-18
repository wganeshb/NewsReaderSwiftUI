//
//  NewsArticle.swift
//  NewsReaderSwiftUI
//
//  Created by Ganesh Balasaheb Waghmode on 16/08/24.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [NewsArticle]
}

struct NewsArticle: Codable, Hashable {
    let source: SourceModel?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct SourceModel: Codable, Hashable {
    let id: String?
    let name: String?
}
