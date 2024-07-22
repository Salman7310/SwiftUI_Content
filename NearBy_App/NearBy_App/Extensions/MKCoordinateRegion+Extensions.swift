//
//  MKCoordinateRegion+Extensions.swift
//  NearBy_App
//
//  Created by Salman_Macbook on 22/07/24.
//

import Foundation
import MapKit

extension MKCoordinateRegion: Equatable {
    
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        if lhs.center.latitude == rhs.center.latitude && lhs.span.latitudeDelta == rhs.span.latitudeDelta && lhs.span.longitudeDelta == lhs.span.longitudeDelta {
            return  true
        } else {
            return false
        }
    }
    
}
