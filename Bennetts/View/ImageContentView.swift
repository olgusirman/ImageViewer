//
//  ImageContentView.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 08/08/2023.
//

import SwiftUI

struct ImageContentView: View {

    var body: some View {
        GeometryReader(content: { geometry in
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<20) { i in
                        VStack {
                            BSAsyncImage(url: .sampleImage)
                                .frame(
                                    maxWidth: geometry.size.width,
                                    maxHeight: geometry.size.height)
                            descriptionView
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        })
    }

    var descriptionView: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack() {
                ProfileImageView()
            }
            Spacer()
            VStack() {
                LikeCountView()
            }
        }
        .padding()
        .background(.thinMaterial)
    }

}

#Preview {
    ImageContentView()
}
