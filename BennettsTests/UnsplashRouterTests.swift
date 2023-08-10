//
//  UnsplashRouterTests.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

@testable import Bennetts
import XCTest

final class UnsplashRouterTests: XCTestCase {
    var stub: UnsplashRouter<UnsplashMockEndpointType>!
    var urlSession: URLSession!
    var url: URL!
    var decoder: JSONDecoder!
    var encoder: JSONEncoder!

    override func setUpWithError() throws {
        URLProtocol.registerClass(TestURLProtocol.self)

        decoder = JSONDecoder()
        encoder = JSONEncoder()

        url = UnsplashMockEndpointType.photos.makeComponent(queryItems: nil).url

        let testConfiguration = URLSessionConfiguration.default
        testConfiguration.protocolClasses = [TestURLProtocol.self]
        urlSession = URLSession(configuration: testConfiguration)
        stub = UnsplashRouter<UnsplashMockEndpointType>(session: urlSession, decoder: decoder)
    }

    override func tearDownWithError() throws {
        URLProtocol.unregisterClass(TestURLProtocol.self)
        urlSession = nil
        stub = nil
        url = nil
        decoder = nil
        encoder = nil
    }

    func testRouter_whenRequestCalled_emitCorrectValues() async throws {
        let mock: [Bennetts.UnsplashPhoto] = .mockRemoteAPIPhotos
        let mockData = try JSONEncoder().encode(mock)

        TestURLProtocol.mockResponses[url] = { _ in
            (result: .success(mockData), statusCode: 200)
        }

        let photo: [UnsplashPhoto] = try await stub.request(.photos)

        XCTAssertEqual(photo.first?.user.name, "Olgu SIRMAN")
    }

    func testRouter_whenResponseStatusCodeInvalid_emitCorrectError() async throws {
        let mock: [Bennetts.UnsplashPhoto] = .mockRemoteAPIPhotos
        let mockData = try JSONEncoder().encode(mock)

        TestURLProtocol.mockResponses[url] = { _ in
            (result: .success(mockData), statusCode: 200)
        }

        struct MockDecodingErrorObject: Decodable {}

        do {
            let photo: MockDecodingErrorObject = try await stub.request(.photos)
            debugPrint(photo)
        } catch {
            XCTAssertEqual(error as! UnsplashRemoteAPIError, UnsplashRemoteAPIError.decoding)
        }
    }
}
