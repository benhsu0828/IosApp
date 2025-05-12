//
//  Item.swift
//  swiftUIButton0428
//
//  Created by paohua hsu on 2025/4/28.
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
