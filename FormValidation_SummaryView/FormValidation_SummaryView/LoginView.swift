//
//  LoginView.swift
//  FormValidation_SummaryView
//
//  Created by Salman_Macbook on 23/05/24.
//

import SwiftUI

enum LoginError: LocalizedError, Identifiable {
    
    case emailEmpty
    case invalidEmail
    case passwordEmpty
    
    var id: Int {
        hashValue
    }
    
    var errorDescription: String? {
        switch self {
           case .emailEmpty:
              return "Email cannot be empty!"
           case .invalidEmail:
              return "Email is not in correct format"
           case .passwordEmpty:
              return "Password cannot be empty"
        }
    }
    
}

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errors: [LoginError] = []
    @State private var isTextvisible: Bool = false
    
    func isValid() -> Bool {
        errors.removeAll()
        
        if email.isEmpty {
            errors.append(.emailEmpty)
        } else if !email.isValidEmail {
            errors.append(.invalidEmail)
        }
        
        if password.isEmpty {
            errors.append(.passwordEmpty)
        }
        
        return errors.isEmpty
    }
    
    private func clearText() {
        email = ""
        password = ""
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
            
            Button(action: {
                if isValid() {
                    self.isTextvisible = true
                    clearText()
                    // Submit a Form
                }
            }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            ValidationSummaryView(errors: errors, isTextVisible: isTextvisible)
        }
    }
}

#Preview {
    LoginView()
}
