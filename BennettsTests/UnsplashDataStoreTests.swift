//
//  UnsplashDataStoreTests.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

@testable import Bennetts
import XCTest

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

        XCTAssertEqual(images.first?.user.name, "Olgu SIRMAN")
    }

    func testDataStore_whenDeleteImages_getCorrectError() async throws {
        // Given
        let images: [Bennetts.UnsplashPhoto] = .mockDataStorePhotos

        // When
        try await stub.saveImages(images: images)
        try await stub.deleteAllImages()

        do {
            _ = try await stub.getImages()
        } catch {
            // Then
            XCTAssertEqual(error as! FileUnsplashCareTaker.UnsplashDataStoreError, FileUnsplashCareTaker.UnsplashDataStoreError.noData)
        }
    }
}
