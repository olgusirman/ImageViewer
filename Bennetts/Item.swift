//
//  Item.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 08/08/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
