//
//  ContentView.swift
//  Places
//
//  Created by Artur Uvarov on 12/26/24.
//


// ContentView.swift
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var places: [Place]
    @State private var showingAddPlace = false
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(places) { place in
                    NavigationLink {
                        PlaceDetailView(place: place)
                    } label: {
                        PlaceRowView(place: place)
                    }
                }
                .onDelete(perform: deletePlaces)
            }
            .navigationTitle("Places")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: { showingAddPlace = true }) {
                        Label("Add Place", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddPlace) {
                AddPlaceView()
            }
        } detail: {
            Text("Select a place")
        }
    }
    
    private func deletePlaces(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(places[index])
            }
        }
    }
}

// PlaceRowView.swift
struct PlaceRowView: View {
    let place: Place
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(place.title)
                .font(.headline)
            Text(place.subtitle)
                .font(.subheadline)
                .lineLimit(2)
            Text("by \(place.author) • \(place.timeStamp, format: .dateTime)")
                .font(.caption)
        }
    }
}




// CommentView.swift
struct CommentView: View {
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(comment.text)
            Text("\(comment.author) • \(comment.timeStamp, format: .dateTime)")
                .font(.caption)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Place.self, inMemory: true)
}
