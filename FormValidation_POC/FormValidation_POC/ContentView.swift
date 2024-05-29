//
//  ContentView.swift
//  FormValidation_POC
//
//  Created by Salman_Macbook on 21/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginFormError = LoginFormError()
    
    var isFormValid: Bool {
        //return !email.isEmpty && !password.isEmpty && email.isValidEmail
        
        loginFormError.clearForm()
        
        if email.isEmpty {
            loginFormError.email = "Email is required!"
        } else if !email.isValidEmail {
            loginFormError.email = "Email is not valid format!"
        }
        
        if password.isEmpty {
            loginFormError.password = "Password is required!"
        }
        
        return loginFormError.email.isEmpty && loginFormError.password.isEmpty
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Email", text: $email).textInputAutocapitalization(.never)
                Text(loginFormError.email).font(.caption)
                SecureField("Password", text: $password)
                Text(loginFormError.password).font(.caption)
                Button("Login") {
                    if isFormValid {
                        print("Login Successful")
                        // Submit Form
                    }
                    
                }//.disabled(!isFormValid)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
