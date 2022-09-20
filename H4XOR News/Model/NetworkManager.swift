//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Adebayo Sotannde on 9/20/22.
//

import Foundation

class NetworkManager: ObservableObject
{
    @ Published var posts = [Post]() //Any intrested parties can pull this value
    
    func fetchData()
    {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url)
            { data, response, error in
                //Write Code here
                if error == nil
                {
                    let decoder = JSONDecoder()
                    if let safeData = data
                    {
                        do
                        {
                            let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async
                            {
                                //Must happen in the main thread. 
                                self.posts = result.hits
                            }
                            
                        }catch
                        {
                            print(error)
                        }
                    }
                    
                }
                
            }
            task.resume()
        }
        
       
    }
}
