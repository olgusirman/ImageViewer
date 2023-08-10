//
//  DependencyContainer.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

public class AppDependencyContainer {
}

extension AppDependencyContainer: UnsplashModelFactory, NavigationModelFactory {

    // TODO: Create repository layer
        // TODO: Inject network manager to repository layer
        // TODO: Inject cache manager to repository layer

    func makeUnsplashModel() -> UnsplashModel {
        let configManager = ConfigManager()
        // TODO: Inject repository layer for fetching images
        return UnsplashModel(configProvider: configManager)
    }

    func makeNavigationModel() -> NavigationModel {
        NavigationModel()
    }
}

protocol UnsplashModelFactory {

  func makeUnsplashModel() -> UnsplashModel
}

protocol NavigationModelFactory {

  func makeNavigationModel() -> NavigationModel
}
