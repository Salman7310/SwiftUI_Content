//
//  Starbucks.swift
//  Test_ StarbucksApp
//
//  Created by Salman_Macbook on 14/03/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Starbucks: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var distance: Int
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

