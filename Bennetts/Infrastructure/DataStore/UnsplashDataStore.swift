//
//  UnsplashDataStore.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

protocol UnsplashDataStore {
    func saveImages(images: [UnsplashPhoto]) async throws
    func getImages() async throws -> [UnsplashPhoto]
}

