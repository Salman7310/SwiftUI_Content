//
//  NumberFormatter+Extensions.swift
//  BudgetApp_CoreData
//
//  Created by Salman_Macbook on 24/06/24.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
}

