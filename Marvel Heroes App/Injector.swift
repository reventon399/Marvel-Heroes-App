//
//  Injector.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 27.11.2022.
//

import Foundation
import UIKit

class Injector {
    static func createModule() -> UIViewController {
        let viewModel = HeroesViewModel()
        let viewController = HeroesViewController(viewModel: viewModel)
        return viewController
    }
}
