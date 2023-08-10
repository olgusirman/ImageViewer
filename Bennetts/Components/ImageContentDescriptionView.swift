//
//  ImageContentDescriptionView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import SwiftUI

struct ImageContentDescriptionView: View {
    var userDisplayName: String
    var userProfileImage: URL?
    var likeCount: Int

    @State private var orientation = UIDeviceOrientation.unknown

    private var isLandscape: Bool {
        orientation == .landscapeLeft || orientation == .landscapeRight
    }

    var body: some View {
        HStack {
            ProfileImageView(name: userDisplayName, photoUrl: userProfileImage)
            Spacer()
            LikeCountView(likeCount: likeCount)
        }
        .padding()
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

#Preview {
    ImageContentDescriptionView(userDisplayName: "Olgu SIRMAN", userProfileImage: .sampleProfileImage, likeCount: 14233)
}
