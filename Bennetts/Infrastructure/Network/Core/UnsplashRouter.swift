//
//  UnsplashRouter.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

struct UnsplashRouter<EndPoint: EndPointType> {

    private let urlSession: URLSession

    public init(session: URLSession) {
        urlSession = session
    }

    func request<T: Decodable>(_ route: EndPoint, queryItems: [URLQueryItem]? = nil) async throws -> T {

        guard let url = route.makeComponent(queryItems: queryItems).url else {
            throw UnsplashRemoteAPIError.createURL
        }

        let (data, response) = try await urlSession.data(from: url)

        guard let httpResponse = (response as? HTTPURLResponse) else {
            throw UnsplashRemoteAPIError.response
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw UnsplashRemoteAPIError.httpError
        }

        guard let decodable = try? JSONDecoder().decode(T.self, from: data) else {
            throw UnsplashRemoteAPIError.decoding
        }

        return decodable
    }
}
