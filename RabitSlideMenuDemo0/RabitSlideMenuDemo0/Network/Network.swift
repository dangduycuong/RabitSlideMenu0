//
//  Network.swift
//  RabitSlideMenuDemo0
//
//  Created by cuongdd on 18/10/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import Foundation

class Network {
    
    static let shared = Network()
    
    func customCallAPI<T: Codable>(url: URL, method: String, completion: @escaping(T)->()) {
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15)
        let headers = [
            "X-RapidAPI-Key": "fb71aa7f62msh153e4924e940392p16bbc4jsn166248f8bdaa",
            "X-RapidAPI-Host": "imdb8.p.rapidapi.com"
        ]
        request.allHTTPHeaderFields = headers
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(T.self, from: data)
                    data.printFormatedJSON()
                    completion(json)
                } catch let error {
                    print("decode error: ", error)
                }
            }
        }
        dataTask.resume()
    }
}
