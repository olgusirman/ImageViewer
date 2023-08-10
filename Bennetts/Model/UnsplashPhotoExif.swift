//
//  UnsplashPhotoExif.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import Foundation

public struct UnsplashPhotoExif: Codable {
    public let aperture: String
    public let exposureTime: String
    public let focalLength: String
    public let iso: String
    public let make: String
    public let model: String

    private enum CodingKeys: String, CodingKey {
        case aperture
        case exposureTime = "exposure_time"
        case focalLength = "focal_length"
        case iso
        case make
        case model
    }
}
