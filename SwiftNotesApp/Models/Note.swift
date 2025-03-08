//
//  Item.swift
//  SwiftNotesApp
//
//  Created by Jared Malan on 2/26/25.
//

import Foundation
import SwiftData

@Model
final class Note {
    var id: UUID
    var title: String
    var content: String
    var timestamp: Date

    init(title: String, content: String, timestamp: Date = Date()) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.timestamp = timestamp
    }
}
