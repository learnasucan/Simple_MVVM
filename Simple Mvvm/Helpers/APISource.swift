//
//  APISource.swift
//  Simple Mvvm
//
//  Created by Prachit on 10/05/22.
//

import Foundation

class APISource {
    
    typealias handler = ([Quotes]) -> Void
    static func getQuotes(completion: @escaping handler) {
        let url = URL(string: "https://breaking-bad-quotes.herokuapp.com/v1/quotes/50")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error)
            } else {
                do {
                    guard let data = data else {  return }
                    let jsonData = try JSONDecoder().decode([Quotes].self, from: data)
                    print(data)
                    completion(jsonData)
                } catch (let e) {
                    print(e)
                }
            }
        }.resume()
    }
}
