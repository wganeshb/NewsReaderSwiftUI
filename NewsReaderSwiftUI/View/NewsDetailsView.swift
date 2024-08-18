//
//  NewsDetailsView.swift
//  NewsReaderSwiftUI
//
//  Created by Ganesh Balasaheb Waghmode on 16/08/24.
//

import SwiftUI

struct NewsDetailsView: View {
    
    let newsArticle: NewsArticle
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(((newsArticle.title == Constants.contentNotAvailable) ? Constants.placeholderDescription : newsArticle.title)!)
                    .font(.system(size: 15.0))
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: newsArticle.urlToImage ?? Constants.placeholderImage)) { image in
                        image.resizable().aspectRatio(contentMode: .fit).cornerRadius(8.0)
                    } placeholder: {
                        ProgressView()
                            .controlSize(.small)
                    }
                    VStack(alignment: .leading, spacing: 3.0) {
                        Text(newsArticle.author ?? "").font(.system(size: 10.0))
                        Text(newsArticle.source?.name ?? "").font(.system(size: 10.0))
                        Text(newsArticle.publishedAt ?? "").font(.system(size: 9.0))
                    }
                }
                Text(((newsArticle.description == Constants.contentNotAvailable) ? Constants.placeholderDescription : (newsArticle.description ?? Constants.placeholderDescription))!)
                    .font(.system(size: 12.0))
                    .foregroundColor(.black)
                
            }.padding(.top, 10.0)
            .padding(.bottom, 10.0)
            .padding(.leading, 10.0)
            .padding(.trailing, 10.0)
            .navigationBarTitleDisplayMode(.inline)
            Spacer()
        }
    }
}

#Preview {
    NewsDetailsView(newsArticle: NewsArticle(source: SourceModel(id: "", name: ""), author: "", title: "", description: "", url: "", urlToImage: "", publishedAt: "", content: ""))
}
