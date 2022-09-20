//
//  WebView.swift
//  H4XOR News
//
//  Created by Adebayo Sotannde on 9/20/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable
{
    
    @Environment(\.dismiss) private var dismiss
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView
    {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context)
    {

        
        if let safeString = urlString
        {
            if let url = URL(string: safeString)
            {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
       
    }
    
    
    
}
