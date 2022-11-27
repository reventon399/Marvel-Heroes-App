//
//  ViewController.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 11.11.2022.
//

import UIKit

class HeroesViewController: UIViewController {
    
    var viewModel: HeroesViewModelType?
    
   
    
    // MARK: - Outlets
    
    private lazy var heroesTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(HeroesCustomTableViewCell.self, forCellReuseIdentifier: HeroesCustomTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }

    
}

//MARK: - Extension

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
