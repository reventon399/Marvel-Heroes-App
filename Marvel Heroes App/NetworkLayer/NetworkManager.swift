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
    
    var publicKey = "e1198af2a04c8e71fbe11a5b2f5de361"
    var privateKey = "61e5bc3ae975a2d192a9512ad456d7e16c41757f"
    
    private func createURL() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = format.string(from: date)
        
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
