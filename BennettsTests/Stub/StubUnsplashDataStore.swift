//
//  StubUnsplashDataStore.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

@testable import Bennetts
import Foundation

final class StubUnsplashDataStore: UnsplashDataStore {
    var images: [UnsplashPhoto] = []

    func saveImages(images: [UnsplashPhoto]) async throws {
        self.images = images
    }

    func getImages() async throws -> [UnsplashPhoto] {
        images
    }

    func deleteAllImages() async throws {
        images.removeAll()
    }
}
