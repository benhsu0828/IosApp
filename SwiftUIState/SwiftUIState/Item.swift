//
//  Item.swift
//  SwiftUIState
//
//  Created by paohua hsu on 2025/5/5.
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
