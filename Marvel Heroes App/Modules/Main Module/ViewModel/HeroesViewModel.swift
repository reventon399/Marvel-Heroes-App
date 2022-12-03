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
    var heroes: [Character] { get set }
    
    func updateHeroes()
}

protocol HeroesViewModelDelegate: AnyObject {
    func updateHeroesTableView()
    func updateUI()
}

final class HeroesViewModel: HeroesViewModelType {
  

    weak var delegate: HeroesViewModelDelegate?
    var heroes: [Character] = []
    var networkManager: NetworkManager?

    func updateHeroes() {
//        networkManager?.getHeroes({
//
//        })
    }
}


