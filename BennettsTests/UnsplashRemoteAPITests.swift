//
//  UnsplashRemoteAPITests.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

@testable import Bennetts
import XCTest

final class UnsplashRemoteAPITests: XCTestCase {
    var stub: UnsplashRemoteAPI!

    override func setUpWithError() throws {
        stub = StubUnsplashRemoteAPI()
    }

    override func tearDownWithError() throws {
        stub = nil
    }

    func testFetchImages() async throws {
        let images = try await stub.fetchImages()

        XCTAssertEqual(images.first?.user.name, "Olgu SIRMAN")
    }
}
