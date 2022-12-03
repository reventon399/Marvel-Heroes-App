//
//  DetailViewController.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 03.12.2022.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var results = [Result]()
    
    //MARK: - Outlets
    
    lazy var imageContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var cellNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var cellIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}
