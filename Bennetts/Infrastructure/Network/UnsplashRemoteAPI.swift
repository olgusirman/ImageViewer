//
//  UnsplashRemoteAPI.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

protocol UnsplashRemoteAPI {
    func fetchImages() async throws -> [UnsplashPhoto]
}

final class UnsplashRemoteAPIProvider: UnsplashRemoteAPI {

    // MARK: - Properties
    let urlSession: URLSession

    private let clientId: String

    // MARK: - Methods
    public init(configProvider: ConfigProvider) {
        let config = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: config)
        clientId = configProvider.getConfig(type: .clientId).clientID
    }

    // TODO: get this from Router
    fileprivate struct UnsplashAPI {
        static let scheme = "https"
        static let host = "api.unsplash.com"
        static let path = "/photos/"
    }

    fileprivate func makeRandomImagesComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = UnsplashAPI.scheme
        components.host = UnsplashAPI.host
        components.path = UnsplashAPI.path

        components.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
        ]

        return components
    }

    func fetchImages() async throws -> [UnsplashPhoto] {

        // TODO: get this component from router
        guard let url = makeRandomImagesComponents().url else {
            throw UnsplashRemoteAPIError.createURL
        }

        let (data, response) = try await urlSession.data(from: url)

        guard let httpResponse = (response as? HTTPURLResponse) else {
            throw UnsplashRemoteAPIError.response
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw UnsplashRemoteAPIError.httpError
        }

        guard let list = try? JSONDecoder().decode([UnsplashPhoto].self, from: data) else {
            throw UnsplashRemoteAPIError.decoding
        }
        return list
    }
}
