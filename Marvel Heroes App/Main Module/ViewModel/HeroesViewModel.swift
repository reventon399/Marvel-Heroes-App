//
//  Parser.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 14.11.2022.
//

import Foundation
import Alamofire

protocol HeroesViewModelType {
    func getHeroes()
    var delegate: HeroesViewModelDelegate? { get set }
    var heroes: [Character] { get set }
}

protocol HeroesViewModelDelegate: AnyObject {
    func updateHeroesTableView() 
}

final class HeroesViewModel: HeroesViewModelType {

    weak var delegate: HeroesViewModelDelegate?
    var heroes: [Character] = []
    
    
    func getHeroes() {
        let urlCreator = HeroesURLCreator()
        let url = urlCreator.createURL(apiPath: MarvelHeroesURL.apiPath,
                                       path: MarvelHeroesURL.path,
                                       timestamp: MarvelHeroesURL.timestamp,
                                       publicKey: ApiKeys.publicKey.rawValue)
        
        
        let request = AF.request(url, method: .get)
        request.responseDecodable(of: CharacterDataWrapper.self) { [self] (data) in
            
            switch data.result {
            case .success:
                
                guard let hero = data.value else { return }
                print(hero)
                let heroes = hero.data.results
                self.heroes = heroes
                
                delegate?.updateHeroesTableView()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}


