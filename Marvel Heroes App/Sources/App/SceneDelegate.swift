//
//  SceneDelegate.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 11.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewModel = HeroesViewModel()
//        let networkManager = NetworkManager()
//        networkManager.getHeroes ({ heroes in
//            viewModel.heroes = heroes
//            DispatchQueue.main.async {
//                viewModel.delegate?.updateUI(heroes: heroes)
//            }
//        })
        
        let viewController = HeroesViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }
}
