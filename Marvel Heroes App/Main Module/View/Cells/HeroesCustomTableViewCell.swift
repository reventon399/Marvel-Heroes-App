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
    
    var hero: Character? {
        didSet {
            guard let hero = hero else { return }
            heroNameLabel.text = hero.name
            heroDescriptionLabel.text = hero.description
            guard let imageUrl = URL(string: String.getUrlString(image: hero.thumbnail!, variant: ImageSize.standardMedium)) else { return }
            heroImage.load(url: imageUrl)
        }
    }
    
    // MARK: - Outlets
    
    private lazy var heroView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var heroImage: UIImageView = {
       let image = UIImageView()
        image.layer.cornerRadius = 29
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var heroNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private lazy var heroDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
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
        addSubview(heroView)
        addSubview(heroImage)
    }
    
    private func setupLayout() {
        heroView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(20)
            make.height.width.equalTo(60)
        }
        
        heroImage.snp.makeConstraints { make in
            make.center.equalTo(heroView)
            make.height.width.equalTo(60)
        }
        
        heroNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(heroView.snp.right).offset(20)
            make.right.equalTo(self).offset(-20)
        }
        
        heroDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(heroNameLabel.snp.bottom).offset(10)
            make.left.equalTo(heroView.snp.right).offset(20)
            make.right.equalTo(self).offset(-20)
        }
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.hero = nil
    }
}
