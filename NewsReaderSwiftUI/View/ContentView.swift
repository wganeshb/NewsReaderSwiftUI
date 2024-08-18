//
//  ContentView.swift
//  NewsReaderSwiftUI
//
//  Created by Ganesh Balasaheb Waghmode on 16/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = Constants.categories[0]
    @State private var searchText = ""
    @State var showActivity = true
    
    var filteredNewsArticles: [NewsArticle] {
        guard !searchText.isEmpty else { return viewModel.articles }
        return viewModel.articles.filter({ (article: NewsArticle) -> Bool in
            return (article.title?.localizedCaseInsensitiveContains(searchText))!
        })
    }
    
    @ObservedObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(filteredNewsArticles, id:\.self) { article in
                        NavigationLink {
                            NewsDetailsView(newsArticle: article)
                            //NewsDetailWebView(urlString: article.url ?? Constants.landingPageURLString)
                        } label: {
                            ArticleRowView(article: article)
                        }
                    }
                    .listRowSeparator(.hidden)
                    .navigationBarItems(trailing:
                                            HStack {
                        Picker(Constants.categoryPlaceholder, selection: $selection) {
                            ForEach(Constants.categories, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(MenuPickerStyle.menu)
                        .onChange(of: self.selection) {
                            print("value changed: \(self.selection)")
                            Task {
                                await viewModel.fetchNewsByCategory(with: self.selection)
                            }
                            
                        }
                    })
                }
                .listStyle(.plain)
                .navigationTitle(Constants.topHeadlines)
                .searchable(text:$searchText, prompt: Constants.searchPlaceholderText)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    LoaderView(tintColor: .blue, scaleSize: 1.0).hidden(viewModel.apiCallCompleted)
                }
            }
            .task {
                await viewModel.fetchNewsByCategory()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
