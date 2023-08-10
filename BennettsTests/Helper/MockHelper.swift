//
//  MockHelper.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation
@testable import Bennetts

extension Array {

    private static var mockJsonName: String {
        "mockUnsplashPhoto.json"
    }

    static var mockRepositoryPhotos: [Bennetts.UnsplashPhoto] {
        Bundle.testBundle(type: StubUnsplashRepository.self).decode([Bennetts.UnsplashPhoto].self, from: mockJsonName)
    }

    static var mockRemoteAPIPhotos: [Bennetts.UnsplashPhoto] {
        Bundle.testBundle(type: StubUnsplashRemoteAPI.self).decode([Bennetts.UnsplashPhoto].self, from: mockJsonName)
    }

    static var mockDataStorePhotos: [Bennetts.UnsplashPhoto] {
        Bundle.testBundle(type: StubUnsplashDataStore.self).decode([Bennetts.UnsplashPhoto].self, from: mockJsonName)
    }
}
