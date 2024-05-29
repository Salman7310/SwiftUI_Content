//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Salman_Macbook on 14/05/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
