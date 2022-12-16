//
//  String + MD5.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 14.11.2022.
//

import CryptoKit
import UIKit

enum ImageNotAvailable: String {
    case notAvailable = "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available"
}

extension String {
  
    var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
    
    static func getImageUrlString(image: Thumbnail, variant: String) -> String? {
        let imageNotAvailable = ImageNotAvailable.notAvailable.rawValue
        
        if image.path == imageNotAvailable {
            return nil
        } else {
            return "\(String(describing: image.path) )/\(variant).\(String(describing: image.imageExtension))"
        }
    }
}
