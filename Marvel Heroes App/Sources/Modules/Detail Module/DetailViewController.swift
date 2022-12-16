//
//  DetailViewController.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 03.12.2022.
//

import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    
    let heroesCustomTableViewCell = HeroesCustomTableViewCell()
    
    
    var detailHero: Result? {
        didSet {
            if let hero = detailHero {
                cellNameLabel.text = hero.description!.isEmpty ? "Information not available" : hero.description
                guard let imageURL = URL(string: String.getImageUrlString(image: hero.thumbnail, variant: ImageSize.standardFantastic) ?? "") else {
                    cellIconImageView.image = UIImage(named: "placeholder")
                    return
                }
                cellIconImageView.loadImageView(url: imageURL)
            }
        }
    }
    
    //MARK: - Outlets
    
    lazy var imageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var cellNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var cellIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = CGColor(red: 100, green: 0, blue: 0, alpha: 1)
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundColor()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(imageContainer)
        imageContainer.addSubview(cellIconImageView)
        view.addSubview(cellNameLabel)
    }
    
    private func setupLayout() {
        imageContainer.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.width.height.equalTo(300)
        }
        cellIconImageView.snp.makeConstraints { make in
            make.center.equalTo(imageContainer)
            make.width.height.equalTo(300)
        }
        cellNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(imageContainer.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
        }
    }
    
    private func setupBackgroundColor() {
        view.backgroundColor = .white
    }
}
