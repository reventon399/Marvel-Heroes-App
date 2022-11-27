//
//  HeroesURLCreator.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 27.11.2022.
//

import Foundation

class HeroesURLCreator {
    let publicKey = "e1198af2a04c8e71fbe11a5b2f5de361"
    let privateKey = "61e5bc3ae975a2d192a9512ad456d7e16c41757f"
    
    func createURL() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = format.string(from: date)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "gateway.marvel.com"
        urlComponents.path = "/v1/public/characters"
        
        let parameters = ["ts": "\(timestamp)",
                          "limit": "30",
                          "apiKey": publicKey,
                          "hash": (timestamp + privateKey + publicKey).MD5]
    }
}
