//
//  MarvelHeroesModel.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 12.11.2022.
//

import Foundation

struct CharacterDataWrapper {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let data : CharacterDataContainer?
    let etag: String?
}

struct CharacterDataContainer {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Character]?
}

struct Character {
    let id: Int?
    let name: String?
    let description: String?
    let modified: Date?
    let resourceURI: String?
    let thumbnail: Image?
}

struct Image {
    let path: String?
    let `extension`: String?
}
