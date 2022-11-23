//
//  HeroesCustomTableViewCell.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 23.11.2022.
//

import UIKit
import SnapKit

class HeroesCustomTableViewCell: UITableViewCell {

    static let identifier = "HeroesCustomTableViewCell"
    
    // MARK: - Outlets
    
    private lazy var heroImageView: UIView = {
       let imageView = UIView()
        
        return imageView
    }()
    
    private lazy var heroImage: UIImageView = {
       let image = UIImageView()
        
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
        addSubview(heroNameLabel)
        addSubview(heroDescriptionLabel)
        addSubview(heroImageView)
        addSubview(heroImage)
    }
    
    private func setupLayout() {
        heroImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(20)
            make.height.width.equalTo(60)
        }
        
        heroImage.snp.makeConstraints { make in
            make.center.equalTo(heroImageView)
            make.height.width.equalTo(60)
        }
        
        heroNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(heroImageView.snp.right).offset(20)
            make.right.equalTo(self).offset(-20)
        }
        
        heroDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(heroNameLabel.snp.bottom).offset(10)
            make.left.equalTo(heroImageView.snp.right).offset(20)
            make.right.equalTo(self).offset(-20)
        }
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}
