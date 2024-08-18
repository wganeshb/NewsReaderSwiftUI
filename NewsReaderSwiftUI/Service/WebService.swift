//
//  WebService.swift
//  NewsReaderSwiftUI
//
//  Created by Ganesh Balasaheb Waghmode on 18/08/24.
//

import Foundation

class WebService {

    func fetchNews(category: String) async throws -> NewsResponse {
        
        let urlString = (category == Constants.categoryPlaceholder) ? QueryComponent.defaultNewsURL() : QueryComponent.categorizedNewsURL(category: category)
        
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else
        {
            throw ErrorCases.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(NewsResponse.self, from: data)
        } catch {
            throw ErrorCases.invalidData
        }
    }
}


