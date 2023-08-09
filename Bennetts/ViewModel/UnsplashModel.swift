//
//  UnsplashViewModel.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import Foundation

actor UnsplashModel: ObservableObject {
    @Published @MainActor private(set) var imageFeed: [UnsplashPhoto] = []

    static let clientId = "xg4tYnJNff0NN4Gf5cK2gbbNHBF6T-3N5QOm2RT-p1I"

    nonisolated func loadImages() async throws {
        await MainActor.run {
            imageFeed.removeAll()
        }
        guard let url = URL(string: "https://api.unsplash.com/photos/?client_id=\(Self.clientId)") else {
            throw "Could not create endpoint URL"
        }
        let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw "The server responded with an error."
        }
        guard let list = try? JSONDecoder().decode([UnsplashPhoto].self, from: data) else {
            throw "The server response was not recognized."
        }
        await MainActor.run {
            imageFeed = list
        }
    }
}
