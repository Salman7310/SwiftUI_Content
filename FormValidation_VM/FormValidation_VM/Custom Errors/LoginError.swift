//
//  LoginError.swift
//  FormValidation_VM
//
//  Created by Salman_Macbook on 22/05/24.
//

import Foundation

enum LoginError: Error, LocalizedError, Identifiable {
    
    case emailEmpty
    case emailInValid
    case passwordEmpty
    
    var id: Int {
        hashValue
    }
    
    var errorDescription: String? {
        
        switch self {
        case .emailEmpty:
            return "Email cannot be empty!"
        case .emailInValid:
            return "Email is not in correct format"
        case .passwordEmpty:
            return "Password cannot be empty"
        }
    }
    // implement failureReason
    // implement recoverySuggestions if needed
}
