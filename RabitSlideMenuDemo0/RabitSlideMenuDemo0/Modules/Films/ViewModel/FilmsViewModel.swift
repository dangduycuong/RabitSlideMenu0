//
//  FilmsViewModel.swift
//  RabitSlideMenuDemo0
//
//  Created by cuongdd on 19/10/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import Foundation

class FilmsViewModel {
    var listFilms = [D]()
    var updateSearch: (() -> Void)?
    
    var searchText: String = "" {
        didSet {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(actionTimer(timer:)), userInfo: ["text": searchText], repeats: false)
        }
    }
    private var timer = Timer()
    
    @objc private func actionTimer(timer: Timer) {
        if let userInfo = timer.userInfo as? [String: String], let text = userInfo["text"] {
            getDocumentation(q: text)
        }
    }
    
    private func getDocumentation(q: String) {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "imdb8.p.rapidapi.com"
        components.path = "/auto-complete"
        
        let queryItems = [URLQueryItem(name: "q", value: q)]
        components.queryItems = queryItems
        guard let url = components.url else {
            return
        }
        Network.shared.customCallAPI(url: url, method: "GET") { (response: Documentation) in
            if let d = response.d {
                self.listFilms = d
                self.updateSearch?()
            }
        }
    }
    
}
