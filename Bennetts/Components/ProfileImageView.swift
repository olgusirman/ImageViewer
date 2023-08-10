//
//  ProfileImageView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import SwiftUI

struct ProfileImageView: View {
    var name: String
    var photoUrl: URL?

    var body: some View {
        HStack {
            AsyncImage(
                url: photoUrl,
                transaction: Transaction(animation: .easeInOut)
            ) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case let .success(image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                        .accessibilityIdentifier("Profile Picture")
                case .failure:
                    Image(systemName: "person.crop.circle")
                @unknown default:
                    EmptyView()
                }
            }
            Text(name)
                .font(.callout.bold())
        }
    }
}

#Preview {
    ProfileImageView(name: "Olgu SIRMAN", photoUrl: .sampleProfileImage)
}
