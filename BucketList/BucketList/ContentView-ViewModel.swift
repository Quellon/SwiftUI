//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Quellon Naicker on 11/11/24.
//

import Foundation
import MapKit
import CoreLocation
import LocalAuthentication


extension ContentView{
    @Observable
    class viewModel{
         private(set) var locations = [Location]()
         var selectedPlace: Location?
        
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
        }
        func update(location: Location) {
            guard let selectedPlace else { return }

            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }
    }
}
