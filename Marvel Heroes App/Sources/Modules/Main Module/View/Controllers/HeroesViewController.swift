//
//  ViewController.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 11.11.2022.
//

import UIKit

final class HeroesViewController: UIViewController {
    
    var viewModel: HeroesViewModelType
    var results = [Result]()
    
    // MARK: - Outlets
    
    private lazy var heroesTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(HeroesCustomTableViewCell.self, forCellReuseIdentifier: HeroesCustomTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        return tableView
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
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
    
    private func setupView() {
        title = "Heroes"
        navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.delegate = self
        viewModel.updateHeroes()
    }
    
    private func setupHierarchy() {
        view.addSubview(heroesTableView)
    }
    
    private func setupLayout() {
        heroesTableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }
}

//MARK: - TableView Extension

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        77
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = heroesTableView.dequeueReusableCell(withIdentifier: HeroesCustomTableViewCell.identifier, for: indexPath) as? HeroesCustomTableViewCell
        let heroes = results[indexPath.row]
        cell?.hero = heroes
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        let heroes = results[indexPath.row]
        viewController.detailHero = heroes
        tableView.deselectRow(at: indexPath, animated: true)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - ViewModel Extension

extension HeroesViewController: HeroesViewModelDelegate {
    func updateUI(heroes: [Result]) {
        results = heroes
        heroesTableView.reloadData()
    }
}
