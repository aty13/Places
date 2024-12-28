//
//  ContentView.swift
//  Places
//
//  Created by Artur Uvarov on 12/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) var modelContext
    
    @Query var places: [Place]
    
    var body: some View {
        VStack {
            
            Button(action: {
                addItem()
            }, label: {
                Text("Add Item")
            })
            
            List {
                ForEach(places) { place in
                    Text(place.title)
                }
            }
        }
    }
    
    func addItem() {
        let place = Place(
                author: "author",
                name: "name",
                description: "description",
                lat: 0.0,
                lng: 0.0
        )
        
        modelContext.insert(place)
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Place.self, inMemory: true)
}
