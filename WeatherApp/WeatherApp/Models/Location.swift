//
//  Location.swift
//  WeatherApp
//
//  Created by Salman_Macbook on 14/05/24.
//

import Foundation

struct Location: Decodable {
    let name: String
    let lat: Double
    let lon: Double
    let state: String
}
