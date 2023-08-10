//
//  DependencyContainer.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

public class AppDependencyContainer {
    // MARK: Long-lived dependencies

    private let configProvider: ConfigProvider
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let fileManager = FileManager.default
    private let session: URLSession

    // MARK: Init

    public init() {
        session = URLSession(configuration: .default)
        configProvider = ConfigManager()
    }

    // MARK: Inject Dependencies

    func makeUnsplashRepository() -> UnsplashRepository {
        let unsplashDataStore = makeUnsplashDataStore()
        let remoteAPI = UnsplashRemoteAPIProvider(configProvider: configProvider,
                                                  session: session,
                                                  decoder: decoder)

        return UnsplashRepositoryProvider(dataStore: unsplashDataStore, remoteAPI: remoteAPI)
    }

    func makeUnsplashDataStore() -> UnsplashDataStore {
        FileUnsplashCareTaker(fileManager: fileManager, encoder: encoder, decoder: decoder)
    }
}

extension AppDependencyContainer: UnsplashModelFactory {
    func makeUnsplashModel() -> UnsplashModel {
        let repository = makeUnsplashRepository()
        return UnsplashModel(repository: repository)
    }
}

extension AppDependencyContainer: NavigationModelFactory {
    func makeNavigationModel() -> NavigationModel {
        NavigationModel()
    }
}
