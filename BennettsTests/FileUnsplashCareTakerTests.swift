//
//  FileUnsplashCareTakerTests.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import XCTest
@testable import Bennetts

final class FileUnsplashCareTakerTests: XCTestCase {

    var stub: FileUnsplashCareTaker!
    var fileManager: FileManager!
    var encoder: JSONEncoder!
    var decoder: JSONDecoder!

    override func setUpWithError() throws {
        fileManager = FileManager.default
        encoder = JSONEncoder()
        decoder = JSONDecoder()
        stub = FileUnsplashCareTaker(fileManager: fileManager, encoder: encoder, decoder: decoder)
    }

    override func tearDownWithError() throws {
        stub = nil
        fileManager = nil
        encoder = nil
        decoder = nil
    }

    func testCareTaker_whenSaveImages_getImagesBack() async throws {

        // Given
        let images: [Bennetts.UnsplashPhoto] = .mockDataStorePhotos

        // When
        try await stub.saveImages(images: images)
        let getImages = try await stub.getImages()

        // Then
        XCTAssertEqual(images, getImages)
    }

    func testCareTaker_whenDeleteAllImages_getNoImageBack() async throws {
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
