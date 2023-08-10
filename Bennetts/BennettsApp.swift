//
//  BennettsApp.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 08/08/2023.
//

import SwiftUI

@main
struct BennettsApp: App {
    private var dependencyContainer = AppDependencyContainer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dependencyContainer.makeUnsplashModel())
                .environmentObject(dependencyContainer.makeNavigationModel())
        }
    }
}
