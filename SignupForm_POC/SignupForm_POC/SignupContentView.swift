//
//  SignupContentView.swift
//  SignupForm_POC
//
//  Created by Salman_Macbook on 23/05/24.
//

import SwiftUI
import CountryPickerView

struct SignupContentView: View {
    
    @State private var signupState = SignupState()
    @State private var selectedCountry: Country?
    @State private var user: User?
    
    let signupClient = SignupHttpClient()
    let apiName = "users"
    
    private func signupUser(user: User?) async {
        do {
            guard let user = try await signupClient.signupHttpRequest(apiName, user: user) else { return }
            self.user = user
            
            signupState.alertMessage = Localized(.accountCreated)
            signupState.showingAlert = true
            signupState.clearData()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $signupState.firstName)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    TextField("Last Name", text: $signupState.lastName)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                }
                
                Section(header: Text("Account Information")) {
                    HStack {
                        /*if let selectedCountry = selectedCountry {
                            Image(uiImage: selectedCountry.flag)
                                .resizable()
                                .frame(width: 24, height: 24)
                        }*/
                        CountryPickerViewWrapper(selectedCountry: $selectedCountry)
                            .frame(height: 25)
                        TextField("Mobile", text: $signupState.mobile)
                    }
                    TextField("Email", text: $signupState.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $signupState.password)
                    
                    TextField("ZIP Code", text: $signupState.zip)
                        .keyboardType(.numberPad)
                    
                    TextField("City", text: $signupState.city)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    TextField("State", text: $signupState.state)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    TextField("Country", text: $signupState.country)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                }
                
                Button(action: {
                    
                    let user = signupState.createUser()
                    Task {
                        await signupUser(user: user)
                    }
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        
        .alert(isPresented: $signupState.showingAlert) {
            Alert(title: Text("Validation Error"), message: Text(signupState.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    SignupContentView()
}
