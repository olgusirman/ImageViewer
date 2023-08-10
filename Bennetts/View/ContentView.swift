//
//  ContentView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 08/08/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: UnsplashModel
    @EnvironmentObject var navigationModel: NavigationModel

    @State private var isDisplayingError = false
    @State private var lastErrorMessage = "None" {
        didSet {
            isDisplayingError = true
        }
    }

    @State private var navigate = false

    var body: some View {
        NavigationStack(path: $navigationModel.photoPath) {
            GeometryReader(content: { geometry in
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(model.imageFeed) { image in
                            FeedImageView(image: image, maxWidth: geometry.size.width)
                        }
                    }
                    .scrollTargetLayout()
                }
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitleDisplayMode(.inline)
                .scrollTargetBehavior(.viewAligned(limitBehavior: .never))
                .navigationDestination(for: UnsplashPhoto.self) { photo in
                    PhotoDetailView(photo: photo)
                }
            })
        }
        .task {
            guard model.imageFeed.isEmpty, ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil else { return }
            do {
                try await model.loadImages()
            } catch {
                lastErrorMessage = error.localizedDescription
            }
        }
        .alert("Error", isPresented: $isDisplayingError, actions: {
            Button("Close", role: .cancel) {}
        }, message: {
            Text(lastErrorMessage)
        })
    }
}
