//
//  APISource.swift
//  Simple Mvvm
//
//  Created by Prachit on 10/05/22.
//

import Foundation

enum QuoteError : Error {
    case noData
    case invalidResponse
    case failedRequest
    case invalidData
}

class APISource {
    
    typealias handler = (QuoteError?, [Quote]) -> Void
    static func getQuotes(completion: @escaping handler) {
        let url = URL(string: "https://breaking-bad-quotes.herokuapp.com/v1/quotes/50")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print("Failed Request from GetQuotes\(String(describing: error?.localizedDescription))")
                completion(.failedRequest,[])
                return
            }
            
            guard let response = response  as? HTTPURLResponse else {
                print("Unable to process response")
                completion(.invalidResponse,[])
                return
            }
            
            guard response.statusCode == 200 else {
                print("Failure request response")
                completion(.failedRequest,[])
                return
            }
            
            do {
                guard let data = data else {  return }
                let jsonData = try JSONDecoder().decode([Quote].self, from: data)
                print(data)
                completion(nil,jsonData)
            } catch (let e) {
                print("Unable to decode Quote Response \(e.localizedDescription)")
                completion(.invalidData,[])
            }
            
        }.resume()
    }
}
