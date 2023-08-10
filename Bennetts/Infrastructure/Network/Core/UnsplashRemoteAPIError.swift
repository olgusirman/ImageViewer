//
//  UnsplashRemoteAPIError.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

enum UnsplashRemoteAPIError: Error {
    case unknown
    case component
    case createURL
    case response
    case httpError
    case decoding
}

extension UnsplashRemoteAPIError: CustomStringConvertible {
    var description: String {
        switch self {
        case .unknown:
            return "Had a problem loading some data.\nPlease try again soon!"
        case .component:
            return "Couldn't create component.\nPlease check your url again."
        case .createURL:
            return "Had a problem creating a URL.\nPlease try again soon!"
        case .httpError:
            return "Had a problem loading some data.\nPlease try again soon!"
        case .response:
            return "Had a problem with unexpected response.\nPlease check your http response data."
        case .decoding:
            return "The server response was not recognized."
        }
    }
}
