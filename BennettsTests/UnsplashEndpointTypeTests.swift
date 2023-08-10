//
//  UnsplashEndpointTypeTests.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

@testable import Bennetts
import XCTest

final class UnsplashEndpointTypeTests: XCTestCase {
    var stub: UnsplashEndpointType!

    override func setUpWithError() throws {
        stub = .photos
    }

    override func tearDownWithError() throws {
        stub = nil
    }

    func testEndpointType_whenConfigureWithoutQueryItems_expectCorrectUrl() async throws {
        // when
        let components = stub.makeComponent(queryItems: nil)

        // then
        XCTAssertEqual(components.url?.absoluteString, "https://api.unsplash.com/photos/")
    }

    func testEndpointType_whenConfigureWithQueryItems_expectCorrectUrl() async throws {
        let queryItems = [URLQueryItem(name: "client_id", value: "1234")]

        // when
        let components = stub.makeComponent(queryItems: queryItems)

        // then
        XCTAssertEqual(components.url?.absoluteString, "https://api.unsplash.com/photos/?client_id=1234")
    }
}
