//
//  ConfigProvider.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

public protocol ConfigProvider {
    func getConfig(type: ConfigManager.ConfigType) -> CredentialProvider
}
