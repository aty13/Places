//
//  PlaceDetailView.swift
//  Places
//
//  Created by Artur Uvarov on 12/26/24.
//

import SwiftUI

struct PlaceDetailView: View {
    let place: Place
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(place.title)
                    .font(.title)
                Text(place.subtitle)
                Text("Location: \(place.lat), \(place.lng)")
                Text("Votes: \(place.votes)")
                
                if !place.comments.isEmpty {
                    Text("Comments")
                        .font(.headline)
                    ForEach(place.comments) { comment in
                        CommentView(comment: comment)
                    }
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
