//
//  MeasurementFormatter+Extensions.swift
//  NearBy_App
//
//  Created by Salman_Macbook on 24/07/24.
//

import Foundation

extension MeasurementFormatter {
    
    static var distance: MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.unitOptions = .naturalScale
        formatter.locale = Locale.current
        return formatter
    }
    
}

