//
//  LoginFormError.swift
//  FormValidation_POC
//
//  Created by Salman_Macbook on 22/05/24.
//

import Foundation

struct LoginFormError {
    var email: String = ""
    var password: String = ""
    
    mutating func clearForm() {
        email = ""
        password = ""
    }
}
