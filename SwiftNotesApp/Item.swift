//
//  Item.swift
//  SwiftNotesApp
//
//  Created by Jared Malan on 3/6/25.
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
