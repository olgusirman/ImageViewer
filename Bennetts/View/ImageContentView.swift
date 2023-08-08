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
                        BSAsyncImage(url: .sampleImage)
                            .frame(
                                maxWidth: geometry.size.width,
                                maxHeight: geometry.size.height)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        })
    }
}

#Preview {
    ImageContentView()
}
