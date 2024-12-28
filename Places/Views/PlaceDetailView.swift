////
////  PlaceDetailView.swift
////  Places
////
////  Created by Artur Uvarov on 12/26/24.
////
//
//import SwiftUI
//
//struct PlaceDetailView: View {
//    let place: Place
//    let controller: PlaceController
//    @State private var newComment = ""
//    @State private var commentAuthor = ""
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 16) {
//                // ... existing place details ...
//                
//                Button(action: {
//                    try? controller.upvotePlace(place)
//                }) {
//                    Label("Upvote", systemImage: "arrow.up")
//                }
//                
//                VStack(alignment: .leading) {
//                    TextField("Your name", text: $commentAuthor)
//                    TextField("Add a comment", text: $newComment)
//                    Button("Post Comment") {
//                        guard !newComment.isEmpty, !commentAuthor.isEmpty else { return }
//                        try? controller.addComment(to: place, text: newComment, author: commentAuthor)
//                        newComment = ""
//                    }
//                }
//            }
//            .padding()
//        }
//    }
//}
