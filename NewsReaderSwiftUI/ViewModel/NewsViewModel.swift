//
//  NewsViewModel.swift
//  NewsReaderSwiftUI
//
//  Created by Ganesh Balasaheb Waghmode on 16/08/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    
    @Published var articles = [NewsArticle]()
    private var cancellables = Set<AnyCancellable>()
    @Published var apiCallCompleted: Bool = false
    
    func fetchNewsByCategory(with category: String = Constants.categoryPlaceholder) async {
        do {
            let newsResponse = try await WebService().fetchNews(category: category)
            let articles: [NewsArticle] = newsResponse.articles.filter {
                ($0.title != Constants.contentNotAvailable) && ($0.description != Constants.contentNotAvailable)
            }
            await MainActor.run {
                self.articles = articles
                apiCallCompleted = true
            }
        } catch (_) {
            
        }
    }
    
}

