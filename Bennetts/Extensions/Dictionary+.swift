//
//  Dictionary+.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 09/08/2023.
//

import Foundation

public extension Dictionary {
    func convert<T, U>(_ transform: ((key: Key, value: Value)) throws -> (T, U)) rethrows -> [T: U] {
        var dictionary = [T: U]()
        for (key, value) in self {
            let transformed = try transform((key, value))
            dictionary[transformed.0] = transformed.1
        }
        return dictionary
    }
}
