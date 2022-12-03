//
//  ViewController.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 11.11.2022.
//

import UIKit

class HeroesViewController: UIViewController {
    
    var viewModel: HeroesViewModelType
    
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
        viewModel.delegate = self
        setupHierarchy()
        setupLayout()
        viewModel.networkManager?.getHeroes()
    }
    
    // MARK: - Initializer
    
    init(viewModel: HeroesViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(heroesTableView)
    }
    
    private func setupLayout() {
        heroesTableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }

    
}

//MARK: - Extension for TableView

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = heroesTableView.dequeueReusableCell(withIdentifier: HeroesCustomTableViewCell.identifier, for: indexPath) as? HeroesCustomTableViewCell
        let heroes = viewModel.heroes[indexPath.row]
        cell?.hero = heroes
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }

}

// MARK: - Extension for ViewModel

extension HeroesViewController: HeroesViewModelDelegate {
    func updateHeroesTableView() {
        heroesTableView.reloadData()
    }
    
    
}
