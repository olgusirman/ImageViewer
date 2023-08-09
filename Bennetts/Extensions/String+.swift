//
//  String+.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}
