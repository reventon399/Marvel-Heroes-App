//
//  MarvelHeroesModel.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 12.11.2022.
//

import Foundation

// MARK: - HeroesData
struct HeroesData: Decodable {
    var data: HeroesDataContainer?
}

// MARK: - HeroesDataContainer
struct HeroesDataContainer: Decodable {
    var results: [Result]?
}

// MARK: - Result
struct Result: Decodable {
    var name: String?
    var description: String?
    var thumbnail: Thumbnail
}

// MARK: - Thumbnail
struct Thumbnail: Decodable {
    let path: String
    let imageExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}

