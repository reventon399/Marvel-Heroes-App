//
//  MarvelHeroesModel.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 12.11.2022.
//

import Foundation

// MARK: - HeroesData
struct HeroesData: Codable {
    var data: HeroesDataContainer?
}

// MARK: - HeroesDataContainer
struct HeroesDataContainer: Codable {
    var results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    var name: String?
    var description: String?
    var thumbnail: Thumbnail
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let `extension`: String
}

