//
//  ProfileImageView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            Text("Olgu SIRMAN")
                .font(.callout.bold())
        }
    }
}

#Preview {
    ProfileImageView()
}
