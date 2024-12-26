//
//  Place.swift
//  Places
//
//  Created by Artur Uvarov on 12/26/24.
//


// Place.swift
import Foundation
import SwiftData

@Model
final class Place {
    var id: String
    var timeStamp: Date
    var author: String
    var title: String
    var subtitle: String
    var lat: Double
    var lng: Double
    var imageUrl: String
    var votes: Int
    
    // Note: For SwiftData relationships, we need to make Comment a @Model class too
    @Relationship(deleteRule: .cascade) var comments: [Comment]
    
    init(id: String = UUID().uuidString,
         timeStamp: Date = Date(),
         author: String = "",
         name: String,
         description: String,
         lat: Double,
         lng: Double,
         imageUrl: String = "",
         votes: Int = 0,
         comments: [Comment] = []) {
        self.id = id
        self.timeStamp = timeStamp
        self.author = author
        self.title = name
        self.subtitle = description
        self.lat = lat
        self.lng = lng
        self.imageUrl = imageUrl
        self.votes = votes
        self.comments = comments
    }
}

// Comment.swift
@Model
final class Comment {
    var id: String
    var text: String
    var author: String
    var timeStamp: Date
    
    init(id: String = UUID().uuidString,
         text: String,
         author: String,
         timeStamp: Date = Date()) {
        self.id = id
        self.text = text
        self.author = author
        self.timeStamp = timeStamp
    }
}
