//
//  Parser.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 14.11.2022.
//

import Foundation
import Alamofire

protocol HeroesViewModelType {
    func getHeroes(url: String, parameters: [String: String])
    var delegate: HeroesViewModelDelegate? { get set }
}

protocol HeroesViewModelDelegate {
    func updateHeroesTableView() 
}

final class HeroesViewModel: HeroesViewModelType {
    
    var delegate: HeroesViewModelDelegate?
    weak var view: HeroesViewController?
    
    func getHeroes(url: String, parameters: [String: String]) {
        let request = AF.request(url, method: .get, parameters: parameters)
        request.responseDecodable(of: CharacterDataContainer.self) { (data) in
            
            switch data.result {
            case .success(let value):
                print(value)
                
                guard let hero = data.value else { return }
                hero.results = view?.heroes
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
   
}


