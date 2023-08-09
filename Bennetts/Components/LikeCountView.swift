//
//  LikeCountView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import SwiftUI

struct LikeCountView: View {
    var likeCount: Int

    var likeCountString: String {
        likeCount.roundedWithAbbreviations
    }

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "suit.heart")
                .font(.title)
            Text(likeCountString)
                .font(.caption.bold())
        }
    }
}

#Preview {
    LikeCountView(likeCount: 4234)
}
