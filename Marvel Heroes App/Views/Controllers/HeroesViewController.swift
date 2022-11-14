//
//  ViewController.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 11.11.2022.
//

import UIKit

class HeroesViewController: UIViewController {

    let publicKey = "e1198af2a04c8e71fbe11a5b2f5de361"
    let privateKey = "61e5bc3ae975a2d192a9512ad456d7e16c41757f"
    let timestamp = Date().timeIntervalSince1970.description

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        fetchRequest()
    }

    func fetchRequest() {
        let request =  "https://gateway.marvel.com/v1/public/characters?ts=\(timestamp)&apikey=\(publicKey)&hash=\(hash)"
    }
}

