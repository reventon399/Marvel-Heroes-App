//
//  HeroesViewModel.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 14.11.2022.
//

import Foundation
import Alamofire

protocol HeroesViewModelType {
    var delegate: HeroesViewModelDelegate? { get set }
    var heroes: [Result] { get set }
    
    func updateHeroes()
}

protocol HeroesViewModelDelegate: AnyObject {
    func updateUI(heroes: [Result])
}

final class HeroesViewModel: HeroesViewModelType {
    
    weak var delegate: HeroesViewModelDelegate?
    var heroes: [Result] = []
    var networkManager = NetworkManager()
    
    func updateHeroes() {
        networkManager.getHeroes() { [weak self] heroes in
            self?.heroes = heroes
            DispatchQueue.main.async {
                self?.delegate?.updateUI(heroes: heroes)
            }
        }
    }
}
