//
//  UnsplashRepositoryTests.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import XCTest
@testable import Bennetts

final class UnsplashRepositoryTests: XCTestCase {

    var stub: UnsplashRepository!

    override func setUpWithError() throws {
        stub = StubUnsplashRepository()
    }

    override func tearDownWithError() throws {
        stub = nil
    }

    func testGetImages() async throws {
        let images = try await stub.getImages()

        XCTAssertEqual(images.first?.user.name, "Sergey Kotenev")
    }
}
