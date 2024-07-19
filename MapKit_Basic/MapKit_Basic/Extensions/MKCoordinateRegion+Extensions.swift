//
//  MKCoordinateRegion+Extensions.swift
//  MapKit_Basic
//
//  Created by Salman_Macbook on 18/07/24.
//

import Foundation
import MapKit

extension MKCoordinateRegion: Equatable {
    
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        if lhs.center.latitude == rhs.center.latitude && lhs.span.latitudeDelta == rhs.span.latitudeDelta && lhs.span.longitudeDelta == rhs.span.longitudeDelta {
            return true
        } else {
            return false
        }
    }
    
    static var coffee: MKCoordinateRegion {
        MKCoordinateRegion(center: .coffee, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
    static var restaurant: MKCoordinateRegion {
        MKCoordinateRegion(center: .restaurant, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
}
