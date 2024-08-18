//
//  WebView.swift
//  NewsReaderSwiftUI
//
//  Created by Ganesh Balasaheb Waghmode on 16/08/24.
//

import SwiftUI
import WebKit

struct NewsDetailWebView: View {
    
    let webView = WebView()
    
    @State var urlString = Constants.landingPageURLString
    
    var body: some View {
        VStack {
            webView
                .padding(.top, 10.0)
                .padding(.bottom, 10.0)
                .padding(.leading, 10.0)
                .padding(.trailing, 10.0)
                .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(){
             webView.loadURL(urlString: urlString)
        }
    }
}
#Preview {
    ContentView()
}


struct WebView: UIViewRepresentable {
    
    let webView: WKWebView
    
    init() {
        self.webView = WKWebView()
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.allowsBackForwardNavigationGestures = false
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func loadURL(urlString: String) {
        webView.load(URLRequest(url: URL(string: urlString)!))
    }
}
