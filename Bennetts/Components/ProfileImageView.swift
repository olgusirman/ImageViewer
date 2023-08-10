//
//  ProfileImageView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import SwiftUI
import Kingfisher

struct ProfileImageView: View {
    var name: String
    var photoUrl: URL?

    var body: some View {
        HStack {
            KFImage(photoUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44)
                .clipShape(Circle())
                .accessibilityIdentifier("Profile Picture")
            Text(name)
                .font(.callout.bold())
        }
    }
}

#Preview {
    ProfileImageView(name: "Olgu SIRMAN", photoUrl: .sampleProfileImage)
}
