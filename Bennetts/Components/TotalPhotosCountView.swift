//
//  TotalPhotosCountView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import SwiftUI

struct TotalPhotosCountView: View {
    var photosCount: Int

    var photosCountString: String {
        photosCount.roundedWithAbbreviations
    }

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "photo.stack.fill")
                .font(.title)
            Text(photosCountString)
                .font(.caption.bold())
        }
    }
}

#Preview {
    TotalPhotosCountView(photosCount: 5345)
}
