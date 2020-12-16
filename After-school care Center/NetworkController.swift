//
//  NetworkController.swift
//  Estate Rental
//
//  Created by 潘丰 on 13/11/2020.
//

import Foundation
class NetworkController {
    func fetchNews(completionHandler: @escaping ([News]) -> (),
                        errorHandler: @escaping (Error?) -> ()) {
        
        let url = URL(string: "https://api.npoint.io/256da2ee7badc12b0ec2")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                // Server error encountered
                errorHandler(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                response.statusCode < 300 else {
                    // Client error encountered
                    errorHandler(nil)
                    return
            }
            
            guard let data = data, let news =
                try? JSONDecoder().decode([News].self, from: data) else {
                    errorHandler(nil)
                    return
            }
            
            // Call our completion handler with our news
            completionHandler(news)
        }
        
        task.resume()
    }
    func fetchImage(for imageUrl: String, completionHandler: @escaping (Data) -> (),
                    errorHandler: @escaping (Error?) -> ()) {
        
        let url = URL(string: imageUrl)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                // Server error encountered
                errorHandler(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                response.statusCode < 300 else {
                    // Client error encountered
                    errorHandler(nil)
                    return
            }
            
            guard let data = data else {
                errorHandler(nil)
                return
            }
            
            // Call our completion handler with our news
            completionHandler(data)
        }
        
        task.resume()
    }
}
