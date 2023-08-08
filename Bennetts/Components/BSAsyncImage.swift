//
//  BSAsyncImage.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 08/08/2023.
//

import SwiftUI

struct BSAsyncImage: View {
    let url: URL?

    var body: some View {
        AsyncImage(
            url: url,
            transaction: Transaction(animation: .easeInOut)
        ) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.secondary)
            case .failure:
                Image(systemName: "photo.fill")
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    BSAsyncImage(url: .sampleImage)
}
