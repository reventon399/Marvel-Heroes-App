//
//  HeroesCustomTableViewCell.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 23.11.2022.
//

import UIKit

class HeroesCustomTableViewCell: UITableViewCell {

    static let identifier = "HeroesCustomTableViewCell"
    
    // MARK: - Outlets
    
    private lazy var heroImageView: UIImageView = {
       let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var heroImage: UIImage = {
       let image = UIImage()
        
        return image
    }()
    
    private lazy var heroNameLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    private lazy var heroDescriptionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
    
    // MARK: - Reuse

}
