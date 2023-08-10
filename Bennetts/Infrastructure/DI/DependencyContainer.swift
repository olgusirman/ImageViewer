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

    // MARK: Init
    public init() {
        configProvider = ConfigManager()
    }

    // MARK: Inject Dependencies
    func makeUnsplashRepository() -> UnsplashRepository {
        let unsplashDataStore = makeUnsplashDataStore()
        let remoteAPI = UnsplashRemoteAPIProvider(configProvider: configProvider)

        return UnsplashRepositoryProvider(dataStore: unsplashDataStore, remoteAPI: remoteAPI)
    }

    func makeUnsplashDataStore() -> UnsplashDataStore {
        FileUnsplashDataStore()
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
