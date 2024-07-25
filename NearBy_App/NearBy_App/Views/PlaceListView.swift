//
//  PlaceListView.swift
//  NearBy_App
//
//  Created by Salman_Macbook on 24/07/24.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let mapItems: [MKMapItem]
    
    // Sorting Places based on distance.
    private var sortedItems: [MKMapItem] {
        
        guard let userLocation = LocationManager.shared.manager.location else {
            return mapItems
        }
        
        return mapItems.sorted { lhs, rhs in
            guard let lhsLocation = lhs.placemark.location, let rhsLocation = rhs.placemark.location else {
                return false
            }
            
            let lhsDistance = userLocation.distance(from: lhsLocation)
            let rhsDistance = userLocation.distance(from: rhsLocation)
            
            return lhsDistance < rhsDistance
        }
    }

    
    var body: some View {
        List(sortedItems, id: \.self) { mapItem in
            Text(mapItem.name ?? "")
            
            PlaceView(mapItem: mapItem)
        }
    }
}

#Preview {
    PlaceListView(mapItems: [PreviewData.apple])
}
