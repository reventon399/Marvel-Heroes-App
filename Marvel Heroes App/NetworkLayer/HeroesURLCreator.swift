//
//  HeroesURLCreator.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 27.11.2022.
//
//"https://gateway.marvel.com/v1/public/characters?ts=\(timestamp)&apikey=\(publicKey)&hash=\(hash)"
//"https://gateway.marvel.com/v1/public/characters?ts=2022-11-29 00:02:51&apiKey=e1198af2a04c8e71fbe11a5b2f5de361&hash=ts=2022-11-29 00:02:51&61e5bc3ae975a2d192a9512ad456d7e16c41757fed526dd18c138b7998d8e919fd911c8f"
import Foundation

enum MarvelHeroesURL {
    
    static var host: String {
        "gateway.marvel.com/v1/"
    }
    static var apiPath: String {
        "https://" + host
    }
    static var path: String {
        "public/characters?"
    }
    
    static var timestamp: String {
        let timestamp = Date().timeIntervalSince1970.description
        return "ts=\(timestamp)&"
    }
}

class HeroesURLCreator {

    private func createHash() -> String {
        MarvelHeroesURL.timestamp + ApiKeys.privateKey.rawValue + ApiKeys.publicKey.rawValue.MD5
    }
    
    func createURL(apiPath: String,
                   path: String,
                   timestamp: String,
                   publicKey: String) -> String {
        
        return "\(apiPath)\(path)\(timestamp)apiKey=\(publicKey)&hash=\(createHash())"
    }
}
