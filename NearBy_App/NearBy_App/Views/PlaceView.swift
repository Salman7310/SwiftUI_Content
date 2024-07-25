//
//  PlaceView.swift
//  NearBy_App
//
//  Created by Salman_Macbook on 24/07/24.
//

import SwiftUI
import MapKit

struct PlaceView: View {
    
    let mapItem: MKMapItem
    
    private var address: String {
        let placemark = mapItem.placemark
        
        return "\(placemark.thoroughfare ?? "") \(placemark.subThoroughfare ?? ""), \(placemark.locality ?? ""), \(placemark.administrativeArea ?? "") \(placemark.postalCode ?? ""), \(placemark.country ?? "") \(placemark.areasOfInterest?.first ?? "")"
    }
    
    private var distance: Measurement<UnitLength>? {
        
        guard let userLocation = LocationManager.shared.manager.location, let destinationLocation = mapItem.placemark.location 
        else {
            return nil
        }
        
        return calculateDistance(from: userLocation, to: destinationLocation)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(mapItem.name ?? "")
                .font(.title3)
            
            Text(address)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let distance {
                Text(distance, formatter: MeasurementFormatter.distance)
            }
        }
    }
    
}

#Preview {
    PlaceView(mapItem: PreviewData.apple)
}
