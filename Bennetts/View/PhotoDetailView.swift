//
//  ProfileView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import SwiftUI

struct PhotoDetailView: View {

    var photo: UnsplashPhoto

    private var user: UnsplashUser {
        photo.user
    }

    private let bannerHeight: CGFloat = 300

    var bannerView: some View {
        AsyncImage(
            url: photo.urls[.regular],
            content: { image in
                image
                    .resizable()
                    .frame(height: bannerHeight)
            },
            placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .frame(height: bannerHeight)
            }
        )
    }

    var profilePictureView: some View {
        AsyncImage(
            url: user.profileImage[.large],
            content: { image in
                image
                    .configureForProfile()
            },
            placeholder: {
                Image(systemName: "person.crop.circle")
                    .configureForProfile()
            }
        )
    }

    var body: some View {
        ScrollView {
            bannerView
                .frame(height: bannerHeight)
            profilePictureView
                .offset(y: -75)
                .padding(.bottom, -75)

            VStack {
                if let name = user.name {
                    Text(name)
                        .font(.title)
                }
                if let portfolioURL = user.portfolioURL?.absoluteString  {
                    HStack {
                        Text(portfolioURL)
                            .font(.body)
                        Spacer()
                    }
                    Divider()
                }
                HStack(alignment: .center) {
                    LikeCountView(likeCount: user.totalLikes)
                    Spacer()
                    TotalPhotosCountView(photosCount: user.totalPhotos)
                }
                .foregroundColor(.secondary)
                
                if let bio = photo.imageDescription {
                    Divider()
                    Text(bio)
                }
            }
            .navigationTitle(user.username)
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}
