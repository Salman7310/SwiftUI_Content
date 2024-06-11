//
//  MapViewContent.swift
//  Test_ StarbucksApp
//
//  Created by Salman_Macbook on 14/03/24.
//

import SwiftUI
import MapKit

struct MapViewContent: View {
    let coordinate: CLLocationCoordinate2D
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
    
    var body: some View {
        Map(position: .constant(.region(region))) {
            Marker("Starbuck",
                   systemImage: "mappin.and.ellipse.circle.fill",
                   coordinate: coordinate)
        }
    }
}

#Preview {
    MapViewContent(coordinate: CLLocationCoordinate2D(latitude: 28.628151, longitude: 77.367783))
}

// Explanation

/*This SwiftUI code defines a MapViewContent struct that represents a view containing a map. The MapViewContent struct takes a coordinate of type CLLocationCoordinate2D as a parameter.

Inside the struct, there is a private computed property region of type MKCoordinateRegion that calculates the region to be displayed on the map based on the given coordinate.

The body property of the struct specifies the content of the view. It contains a Map view with a marker titled "Starbuck", using the system image "mappin.and.ellipse.circle.fill", and positioned at the given coordinate.

The Preview block at the end of the code previews the MapViewContent with a specific coordinate (latitude: 28.628151, longitude: 77.367783) in the SwiftUI canvas.

In summary, this SwiftUI code creates a custom map view with a marker at a specific coordinate.*/






