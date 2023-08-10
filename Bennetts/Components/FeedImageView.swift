//
//  FeedImageView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import SwiftUI

struct FeedImageView: View {
    var image: UnsplashPhoto
    var maxWidth: CGFloat

    var body: some View {
        ZStack {
            NavigationLink(value: image) {
                BSAsyncImage(url: image.urls[.regular])
                    .frame(
                        maxWidth: maxWidth
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
