//
//  MarvelHeroesModel.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 12.11.2022.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    var results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    var name: String?
    var description: String?
    var thumbnail: Thumbnail?
//    let comics, series: Comics
//    let stories: Stories
//    let events: Comics
}

// MARK: - Comics
//struct Comics: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [ComicsItem]
//    let returned: Int
//}

// MARK: - ComicsItem
//struct ComicsItem: Codable {
//    let resourceURI: String
//    let name: String
//}

// MARK: - Stories
//struct Stories: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [StoriesItem]
//    let returned: Int
//}

// MARK: - StoriesItem
//struct StoriesItem: Codable {
//    let resourceURI: String
//    let name: String
//    let type: ItemType
//}
//
//enum ItemType: String, Codable {
//    case cover = "cover"
//    case empty = ""
//    case interiorStory = "interiorStory"
//}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    var path: String
    var thumbnailExtension: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

