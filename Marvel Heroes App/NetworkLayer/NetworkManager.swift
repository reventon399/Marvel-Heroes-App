//
//  HeroesURLCreator.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 27.11.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    private var publicKey = "e1198af2a04c8e71fbe11a5b2f5de361"
    private var privateKey = "61e5bc3ae975a2d192a9512ad456d7e16c41757f"
    
    public func getURL(publicKey: String, privateKey: String) -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = format.string(from: date)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "gateway.marvel.com"
        urlComponents.path = "/v1/public/characters"
        urlComponents.queryItems = [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "hash", value: (timestamp + privateKey + publicKey).MD5)]
        return urlComponents.url!.absoluteString
    }
    
    func getHeroes(_ completion: @escaping ([Result]) -> Void) {
        let url = getURL(publicKey: publicKey, privateKey: privateKey)
        print(url)
        _ = AF.request(url).responseDecodable(of: Welcome.self) { result in
            switch result.result {
            case .success(let data):
                print(data.data?.results ?? [])
                completion(data.data?.results ?? [])
            case .failure(let error):
                print("Error in Decoding - \(error)")
            }
        }
    }
}
