//
//  LocalizedError+Extensions.swift
//  FormValidation_SummaryView
//
//  Created by Salman_Macbook on 23/05/24.
//

import Foundation

extension LocalizedError {
    
    var id: Int {
        localizedDescription.hashValue
    }
    
}
