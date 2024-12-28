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
    

    init(
        timeStamp: Date = Date(),
         author: String = "",
         name: String,
         description: String,
         lat: Double,
         lng: Double,
         imageUrl: String = "",
         votes: Int = 0
    ) {
        self.id = UUID().uuidString
        self.timeStamp = timeStamp
        self.author = author
        self.title = name
        self.subtitle = description
        self.lat = lat
        self.lng = lng
        self.imageUrl = imageUrl
        self.votes = votes
    }
}

enum Category {
    case food
    case sightseeing
    case etc
}
