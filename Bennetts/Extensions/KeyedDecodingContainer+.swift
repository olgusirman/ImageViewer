//
//  KeyedDecodingContainer+.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import Foundation
import UIKit

extension KeyedDecodingContainer {
    func decode(_: UIColor.Type, forKey key: Key) throws -> UIColor {
        let hexColor = try decode(String.self, forKey: key)
        return UIColor(hexString: hexColor)
    }

    func decode(_: [UnsplashPhoto.URLKind: URL].Type, forKey key: Key) throws -> [UnsplashPhoto.URLKind: URL] {
        let urlsDictionary = try decode([String: String].self, forKey: key)
        var result = [UnsplashPhoto.URLKind: URL]()
        for (key, value) in urlsDictionary {
            if let kind = UnsplashPhoto.URLKind(rawValue: key),
               let url = URL(string: value)
            {
                result[kind] = url
            }
        }
        return result
    }

    func decode(_: [UnsplashPhoto.LinkKind: URL].Type, forKey key: Key) throws -> [UnsplashPhoto.LinkKind: URL] {
        let linksDictionary = try decode([String: String].self, forKey: key)
        var result = [UnsplashPhoto.LinkKind: URL]()
        for (key, value) in linksDictionary {
            if let kind = UnsplashPhoto.LinkKind(rawValue: key),
               let url = URL(string: value)
            {
                result[kind] = url
            }
        }
        return result
    }

    func decode(_: [UnsplashUser.ProfileImageSize: URL].Type, forKey key: Key) throws -> [UnsplashUser.ProfileImageSize: URL] {
        let sizesDictionary = try decode([String: String].self, forKey: key)
        var result = [UnsplashUser.ProfileImageSize: URL]()
        for (key, value) in sizesDictionary {
            if let size = UnsplashUser.ProfileImageSize(rawValue: key),
               let url = URL(string: value)
            {
                result[size] = url
            }
        }
        return result
    }
}
