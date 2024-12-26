//
//  Item.swift
//  Places
//
//  Created by Artur Uvarov on 12/26/24.
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
