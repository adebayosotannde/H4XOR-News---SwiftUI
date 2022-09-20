//
//  ContentView.swift
//  H4XOR News
//
//  Created by Adebayo Sotannde on 9/20/22.
//

import SwiftUI

struct ContentView: View
{
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View
    {
        NavigationView
        {
            List(networkManager.posts)
            { post in
                NavigationLink(destination: DetailView(url: post.url))
                {
                    HStack
                    {
                        VStack
                        {
                            Text("Hits")
                            Text(String(post.points))
                        }
                        Text(post.title)
                    }
                }
               
            }
            .navigationTitle("H4XOR NEWS")
        }.onAppear
        {
            //Fetch Data from the Internet
            self.networkManager.fetchData()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


