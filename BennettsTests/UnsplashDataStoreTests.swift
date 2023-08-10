//
//  UnsplashDataStoreTests.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import XCTest
@testable import Bennetts

final class UnsplashDataStoreTests: XCTestCase {

    var stub: UnsplashDataStore!

    override func setUpWithError() throws {
        stub = StubUnsplashDataStore()
    }

    override func tearDownWithError() throws {
        stub = nil
    }

    func testDataStore_whenSaveAndGetImages_getCorrectValue() async throws {

        // Given
        let photos: [Bennetts.UnsplashPhoto] = .mockDataStorePhotos

        // When
        try await stub.saveImages(images: photos)

        // Then
        let images = try await stub.getImages()

        XCTAssertEqual(images.first?.user.name, "Sergey Kotenev")
    }
}
