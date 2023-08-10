//
//  ConfigManager.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

public final class ConfigManager: ConfigProvider {
    public enum ConfigType {
        case network
    }

    public func getConfig(type: ConfigType) -> CredentialProvider {
        switch type {
        case .network:
            return UnsplashConfig()
        }
    }
}
