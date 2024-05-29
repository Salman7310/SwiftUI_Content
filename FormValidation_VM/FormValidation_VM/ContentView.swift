//
//  ContentView.swift
//  FormValidation_VM
//
//  Created by Salman_Macbook on 22/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var loginState = LoginState()
    
    var body: some View {
        VStack {
            Form {
                TextField("Email", text: $loginState.email).textInputAutocapitalization(.never)
                if let emailError = loginState.emailError {
                    Text(emailError.localizedDescription)
                        .font(.caption)
                        .foregroundColor(.red)
                }
                SecureField("Password", text: $loginState.password)
                if let passwordError = loginState.passwordError {
                    Text(passwordError.localizedDescription)
                        .font(.caption)
                        .foregroundColor(.red)
                }
                Button("Login") {
                    if loginState.isValid() {
                        // Submit Form
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
