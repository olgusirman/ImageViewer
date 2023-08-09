//
//  ImageContentView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 08/08/2023.
//

import SwiftUI

struct ImageContentView: View {

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
                    HStack (spacing: 0) {
                        ForEach(model.imageFeed) { image in
                            ZStack {
                                NavigationLink(value: image) {
                                    BSAsyncImage(url: image.urls[.regular])
                                        .frame(
                                            maxWidth: geometry.size.width
                                        )
                                }
                                VStack {
                                    Spacer()
                                    ImageContentDescriptionView(userDisplayName: image.user.displayName,
                                                                userProfileImage: image.user.profileImage[.small],
                                                                likeCount: image.user.totalLikes)
                                    .padding([.bottom], 40)
                                    .background(Material.thinMaterial)
                                }
                            }
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
            guard model.imageFeed.isEmpty else { return }
            do {
                try await model.loadImages()
            } catch {
                lastErrorMessage = error.localizedDescription
            }
        }
        .alert("Error", isPresented: $isDisplayingError, actions: {
            Button("Close", role: .cancel) { }
        }, message: {
            Text(lastErrorMessage)
        })
    }
}
