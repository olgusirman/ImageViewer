//
//  BennettsApp.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 08/08/2023.
//

import SwiftUI
import SwiftData

@main
struct BennettsApp: App {

    private var model = UnsplashModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
