//
//  TestURLProtocol.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

public final class TestURLProtocol: URLProtocol {
    public typealias MockResponse = (URLRequest) -> (
        result: Result<Data, Error>, statusCode: Int?
    )

    public static var mockResponses: [URL: MockResponse] = [:]

    override public class func canInit(with request: URLRequest) -> Bool {
        return request.url?.absoluteString == "https://api.sirman.com/photos/"
    }

    override public class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override public func startLoading() {
        guard
            let responseBlock = TestURLProtocol.mockResponses[
                request.url!.removingQueries
            ]
        else { fatalError("No mock response") }
        let response = responseBlock(request)

        if let statusCode = response.statusCode {
            let httpURLResponse = HTTPURLResponse(
                url: request.url!,
                statusCode: statusCode,
                httpVersion: nil,
                headerFields: nil
            )!
            client?.urlProtocol(
                self,
                didReceive: httpURLResponse,
                cacheStoragePolicy: .notAllowed
            )
        }

        switch response.result {
        case let .success(data):
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)

        case let .failure(error):
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override public func stopLoading() {}
}

extension URL {
    var removingQueries: URL {
        if var components = URLComponents(string: absoluteString) {
            components.query = nil
            return components.url ?? self
        } else {
            return self
        }
    }
}
