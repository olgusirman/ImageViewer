//
//  UnsplashMockEndpointType.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

@testable import Bennetts
import Foundation

enum UnsplashMockEndpointType: EndPointType {
    case photos

    var scheme: String {
        "https"
    }

    var host: String {
        "api.sirman.com"
    }

    var path: String {
        switch self {
        case .photos:
            return "/photos/"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        .request
    }

    var headers: HTTPHeaders? {
        nil
    }

    func makeComponent(queryItems: [URLQueryItem]?) -> URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        return components
    }
}
