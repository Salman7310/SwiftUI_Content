//
//  SignupUserCreated.swift
//  SignupForm_POC
//
//  Created by Salman_Macbook on 24/05/24.
//

import Foundation

struct Geolocation: Codable {
    let lat: String
    let long: String
}

struct Address: Codable {
    let city: String
    let street: String
    let number: Int
    let zipcode: String
    let geolocation: Geolocation
}

struct Name: Codable {
    let firstname: String
    let lastname: String
}

struct User: Codable {
    let id: Int
    let email: String
    let username: String
    let password: String
    let name: Name
    let address: Address
    let phone: String
}
