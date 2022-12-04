//
//  String + MD5.swift
//  Marvel Heroes App
//
//  Created by Алексей Лосев on 14.11.2022.
//

import CryptoKit
import UIKit

extension String {
    var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
    
    static func getImageUrlString(image: Thumbnail, variant: String) -> String {
        return "\(String(describing: image.path) )/\(variant).\(String(describing: image.extension))"
    }
}
