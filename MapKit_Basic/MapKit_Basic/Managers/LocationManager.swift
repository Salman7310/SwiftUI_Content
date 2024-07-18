//
//  LocationManager.swift
//  MapKit_Basic
//
//  Created by Salman_Macbook on 18/07/24.
//

import Foundation
import MapKit

@MainActor class LocationManager {
    
    static let shared = LocationManager()
    let manager: CLLocationManager
    
    init() {
        self.manager = CLLocationManager()
        if self.manager.authorizationStatus == .notDetermined {
            self.manager.requestWhenInUseAuthorization()
        }
    }
    
}
