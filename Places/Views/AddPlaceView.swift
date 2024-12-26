//
//  AddPlaceView.swift
//  Places
//
//  Created by Artur Uvarov on 12/26/24.
//


import SwiftUI

struct AddPlaceView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var author = ""
    @State private var lat = 0.0
    @State private var lng = 0.0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description, axis: .vertical)
                TextField("Author", text: $author)
                TextField("Latitude", value: $lat, format: .number)
                TextField("Longitude", value: $lng, format: .number)
            }
            .navigationTitle("New Place")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addPlace()
                    }
                    .disabled(name.isEmpty || description.isEmpty)
                }
            }
        }
    }
    
    private func addPlace() {
        let place = Place(author: author,
                         name: name,
                         description: description,
                         lat: lat,
                         lng: lng)
        modelContext.insert(place)
        dismiss()
    }
}
