//
//  BSAsyncImage.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 08/08/2023.
//

import SwiftUI
import Kingfisher

struct BSAsyncImage: View {
    let url: URL?
    
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    BSAsyncImage(url: .sampleImage)
}
