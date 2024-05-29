//
//  NumberFormatter+Extensions.swift
//  MV_Pattern_POC
//
//  Created by Salman_Macbook on 21/05/24.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
}
