//
//  ConfigManager.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

final public class ConfigManager: ConfigProvider {

    public enum ConfigType {
        case clientId
    }

    public func getConfig(type: ConfigType) -> CredentialProvider {
        switch type {
        case .clientId:
            return UnsplashConfig()
        }
    }
}
