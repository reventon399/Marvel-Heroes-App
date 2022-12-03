//
//  HeroesURLCreator.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 27.11.2022.
//
//"https://gateway.marvel.com/v1/public/characters?ts=\(timestamp)&apikey=\(publicKey)&hash=\(hash)"

//"https://gateway.marvel.com/v1/public/characters?ts=2022-11-2900:02:51&apiKey=e1198af2a04c8e71fbe11a5b2f5de361&hash=ts=2022-11-2900:02:51&61e5bc3ae975a2d192a9512ad456d7e16c41757fed526dd18c138b7998d8e919fd911c8f"
import Foundation
import Alamofire

class NetworkManager {
    
    var viewModel: HeroesViewModel?

    enum MarvelHeroesURL {
        
        static var scheme: String {
            "https://"
        }
        static var host: String {
            "gateway.marvel.com"
        }
        static var apiPath: String {
            "https://" + host
        }
        static var path: String {
            "/v1/public/characters"
        }
        static var timestamp: String {
            Date().timeIntervalSince1970.description
        }
    }
    
    private func createHash() -> String {
        MarvelHeroesURL.timestamp + ApiKeys.privateKey.rawValue + ApiKeys.publicKey.rawValue.MD5
    }
    
    private func createURL() -> String {
        let hash = createHash()
        var urlComponents = URLComponents()
        urlComponents.scheme = MarvelHeroesURL.scheme
        urlComponents.host = MarvelHeroesURL.host
        urlComponents.path = MarvelHeroesURL.path
        urlComponents.queryItems = [
            URLQueryItem(name: "ts", value: MarvelHeroesURL.timestamp),
            URLQueryItem(name: "apiKey", value: ApiKeys.publicKey.rawValue),
            URLQueryItem(name: "hash", value: hash)
        ]
        print (urlComponents.url?.description as Any)
        return urlComponents.url?.description ?? ""
    }
    
    func getHeroes(_ completion: @escaping ([CharacterDataWrapper]) -> Void) {
        let url = createURL()
        let request = AF.request(url, method: .get)
        request.responseDecodable(of: CharacterDataWrapper.self) { [self] (data) in
            
            switch data.result {
            case .success:
            
                guard let hero = data.value else { return }
                print(hero)
                
                let heroes = hero.data.results
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
