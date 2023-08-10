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
    private let clientId: String
    private let router: UnsplashRouter<UnsplashEndpointType>

    // MARK: - Methods
    public init(configProvider: ConfigProvider, session: URLSession, decoder: JSONDecoder) {
        clientId = configProvider.getConfig(type: .network).clientID
        router = UnsplashRouter<UnsplashEndpointType>(session: session, decoder: decoder)
    }

    func fetchImages() async throws -> [UnsplashPhoto] {
        let queryItem = [URLQueryItem(name: "client_id", value: clientId)]
        let list: [UnsplashPhoto] = try await router.request(.photos, queryItems: queryItem)
        return list
    }
}
