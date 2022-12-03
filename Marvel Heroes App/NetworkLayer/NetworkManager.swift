//
//  HeroesURLCreator.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 27.11.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    var publicKey = "e1198af2a04c8e71fbe11a5b2f5de361"
    var privateKey = "61e5bc3ae975a2d192a9512ad456d7e16c41757f"
    
    private func createURL(publicKey: String, privateKey: String) -> String {
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
            URLQueryItem(name: "apiKey", value: publicKey),
            URLQueryItem(name: "hash", value: (timestamp + publicKey + privateKey).MD5)]
        
        return urlComponents.url?.absoluteString ?? "Беды с URL"
    }
    
    func getHeroes(_ completion: @escaping ([Result]) -> Void) {
        let url = createURL(publicKey: publicKey, privateKey: privateKey)
        let request = AF.request(url, method: .get)
        request.responseDecodable(of: HeroesData.self) { result in
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
