//
//  UnsplashConfig.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

struct UnsplashConfig: CredentialProvider {
    var clientID: String {
        if let clientId = Bundle.main.infoDictionary?["CLIENT_ID"] as? String {
            return clientId
        }
        assert(true, "Please provide a Unsplash clientId on Config file")
        return ""
    }
}
