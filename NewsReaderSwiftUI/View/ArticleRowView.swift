//
//  ArticleRowView.swift
//  NewsReaderSwiftUI
//
//  Created by Ganesh Balasaheb Waghmode on 16/08/24.
//

import SwiftUI

struct ArticleRowView: View {
    @State var article: NewsArticle
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(((article.title == Constants.contentNotAvailable) ? Constants.placeholderDescription : article.title)!)
                .font(.system(size: 15.0))
            
            HStack(alignment: .top, spacing: 10.0) {
                Text(((article.description == Constants.contentNotAvailable) ? Constants.placeholderDescription : (article.description ?? Constants.placeholderDescription))!)
                    .font(.system(size: 12.0))
                    .foregroundColor(.black)
                
                AsyncImage(url: URL(string: Utility.getUrlString(inputString: article.urlToImage) ?? Constants.placeholderImage)!) { image in
                    image.resizable().aspectRatio(contentMode: .fit).cornerRadius(8.0)
                } placeholder: {
                    ProgressView()
                        .controlSize(.small)
                }
            }
        }
    }
}

#Preview {
    ArticleRowView(article: NewsArticle(source: SourceModel(id: "", name: ""), author: "", title: "", description: "", url: "", urlToImage: "", publishedAt: "", content: ""))
}
