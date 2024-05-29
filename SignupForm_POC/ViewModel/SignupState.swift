//
//  SignupState.swift
//  SignupForm_POC
//
//  Created by Salman_Macbook on 23/05/24.
//

import Foundation
import CountryPickerView

// THIS IS THE VM
struct SignupState {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    var zip = ""
    var city = ""
    var state = ""
    var country = ""
    var selectedCountry: Country?
    var mobile = ""
    
    var showingAlert = false
    var alertMessage = ""
    
    mutating func validateForm() {
        if firstName.isEmpty {
            alertMessage = "First name is required."
            showingAlert = true
            return
        }
        
        if lastName.isEmpty {
            alertMessage = "Last name is required."
            showingAlert = true
            return
        }
        
        if mobile.isEmpty {
            alertMessage = "Mobile Number is required."
            showingAlert = true
            return
        }
        
        if !email.isValidEmail {
            alertMessage = "Invalid email address."
            showingAlert = true
            return
        }
        
        if password.count < 6 {
            alertMessage = "Password must be at least 6 characters."
            showingAlert = true
            return
        }
        
        if zip.isEmpty {
            alertMessage = "ZIP code is required."
            showingAlert = true
            return
        }
        
        if city.isEmpty {
            alertMessage = "City is required."
            showingAlert = true
            return
        }
        
        if state.isEmpty {
            alertMessage = "State is required."
            showingAlert = true
            return
        }
        
        if country.isEmpty {
            alertMessage = "Country is required."
            showingAlert = true
            return
        }
        
        /*if selectedCountry == nil {
            alertMessage = "Country is required."
            showingAlert = true
            return
        }*/
        
        alertMessage = "Signup successful!"
        showingAlert = true
    }
    
    internal func createUser() -> User {
        let geolocation = Geolocation(lat: "23.344101", long: "85.309563")
        let address = Address(city: city, street: "", number: 0, zipcode: zip, geolocation: geolocation)
        let name = Name(firstname: firstName, lastname: lastName)
        return User(id: Int.random(in: 0..<100), email: email, username: email, password: password, name: name, address: address, phone: mobile)
    }
    
    mutating func clearData() {
        firstName = ""
        lastName = ""
        email = ""
        password = ""
        zip = ""
        city = ""
        state = ""
        country = ""
        mobile = ""
    }
    
}
