//
//  ContentView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 08/08/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @StateObject private var navigationModel = NavigationModel()

    var body: some View {
        ImageContentView()
            .environmentObject(navigationModel)
    }
}

#Preview {
    ContentView()
}
