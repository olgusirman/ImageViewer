//
//  UnsplashRepositoryProvider.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

public class UnsplashRepositoryProvider: UnsplashRepository {
    // MARK: - Properties

    let dataStore: UnsplashDataStore
    let remoteAPI: UnsplashRemoteAPI
    // TODO: MemoryCacheStore also can be inject here if needed

    // MARK: - Methods

    init(dataStore: UnsplashDataStore, remoteAPI: UnsplashRemoteAPI) {
        self.dataStore = dataStore
        self.remoteAPI = remoteAPI
    }

    public func getImages() async throws -> [UnsplashPhoto] {
        // TODO: check and return memory cache if needed

        let images = try await remoteAPI.fetchImages()
        try await dataStore.saveImages(images: images)
        return images
    }
}
