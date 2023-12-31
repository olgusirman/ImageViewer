//
//  UnsplashPhoto.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import Foundation
import SwiftUI

public struct UnsplashPhoto: Codable, Identifiable {
    public var id: String {
        identifier
    }

    public enum URLKind: String, Codable {
        case raw
        case full
        case regular
        case small
        case thumb
    }

    public enum LinkKind: String, Codable {
        case own = "self"
        case html
        case download
        case downloadLocation = "download_location"
    }

    public let identifier: String
    public let height: CGFloat
    public let width: CGFloat
    public let color: Color?
    public let exif: UnsplashPhotoExif?
    public let user: UnsplashUser
    public let urls: [URLKind: URL]
    public let links: [LinkKind: URL]
    public let likesCount: Int
    public let downloadsCount: Int?
    public let viewsCount: Int?
    public let imageDescription: String?

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case height
        case width
        case color
        case exif
        case user
        case urls
        case links
        case likesCount = "likes"
        case downloadsCount = "downloads"
        case viewsCount = "views"
        case imageDescription = "description"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try container.decode(String.self, forKey: .identifier)
        imageDescription = try container.decodeIfPresent(String.self, forKey: .imageDescription)
        height = try container.decode(CGFloat.self, forKey: .height)
        width = try container.decode(CGFloat.self, forKey: .width)

        if let hexString = try? container.decode(String.self, forKey: .color) {
            color = Color(hex: hexString)
        } else {
            color = nil
        }

        exif = try? container.decode(UnsplashPhotoExif.self, forKey: .exif)
        user = try container.decode(UnsplashUser.self, forKey: .user)
        urls = try container.decode([URLKind: URL].self, forKey: .urls)
        links = try container.decode([LinkKind: URL].self, forKey: .links)
        likesCount = try container.decode(Int.self, forKey: .likesCount)
        downloadsCount = try? container.decode(Int.self, forKey: .downloadsCount)
        viewsCount = try? container.decode(Int.self, forKey: .viewsCount)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(identifier, forKey: .identifier)
        try container.encodeIfPresent(imageDescription, forKey: .imageDescription)
        try container.encode(height, forKey: .height)
        try container.encode(width, forKey: .width)
        try? container.encode(color?.hexString, forKey: .color)
        try? container.encode(exif, forKey: .exif)
        try container.encode(user, forKey: .user)
        try container.encode(urls.convert { ($0.key.rawValue, $0.value.absoluteString) }, forKey: .urls)
        try container.encode(links.convert { ($0.key.rawValue, $0.value.absoluteString) }, forKey: .links)
        try container.encode(likesCount, forKey: .likesCount)
        try? container.encode(downloadsCount, forKey: .downloadsCount)
        try? container.encode(viewsCount, forKey: .viewsCount)
    }
}

extension UnsplashPhoto: Equatable {
    public static func == (lhs: UnsplashPhoto, rhs: UnsplashPhoto) -> Bool {
        lhs.id == rhs.id
    }
}

extension UnsplashPhoto: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
