//
//  UnsplashViewModel.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import Foundation

actor UnsplashModel: ObservableObject {
    @Published @MainActor private(set) var imageFeed: [UnsplashPhoto] = []

    private let repository: UnsplashRepository

    init(repository: UnsplashRepository) {
        self.repository = repository
    }

    nonisolated func loadImages() async throws {
        await MainActor.run {
            imageFeed.removeAll()
        }
        do {
            let images = try await repository.getImages()
            await MainActor.run {
                imageFeed = images
            }
        } catch {
            throw error.localizedDescription
        }
    }
}
