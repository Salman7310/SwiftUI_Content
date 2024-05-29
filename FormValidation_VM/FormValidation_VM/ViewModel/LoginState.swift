//
//  LoginState.swift
//  FormValidation_VM
//
//  Created by Salman_Macbook on 22/05/24.
//

import Foundation

// MOVE TO SEPARATE FILE/// THIS IS THE VM
struct LoginState {
    var email: String = ""
    var password: String = ""
    //var errors: [LoginError] = []
    var emailError: LoginError?
    var passwordError: LoginError?
    
    mutating func clearErrors() {
        //errors.removeAll()
        emailError = nil
        passwordError = nil
    }
    
    mutating func isValid() -> Bool {
        
        clearErrors()
        
        if email.isEmpty {
            //errors.append(.emailEmpty)
            emailError = LoginError.emailEmpty
        } else if !email.isValidEmail {
            //errors.append(.emailInValid)
            emailError = LoginError.emailInValid
        }
        if password.isEmpty {
            //errors.append(.passwordEmpty)
            passwordError = LoginError.passwordEmpty
        }
        return emailError == nil && passwordError == nil //errors.isEmpty
    }
}
