//
//  Item.swift
//  golden agenda
//
//  Created by Yongmin Kim on 2024-06-23.
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
