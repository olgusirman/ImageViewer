//
//  NavigationModel.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import Foundation

final class NavigationModel: ObservableObject {
    @Published var photoPath: [UnsplashPhoto]

    init(photoPath: [UnsplashPhoto] = []) {
        self.photoPath = photoPath
    }

    var selectedPhoto: UnsplashPhoto? {
        get { photoPath.first }
        set { photoPath = [newValue].compactMap { $0 }}
    }
}
