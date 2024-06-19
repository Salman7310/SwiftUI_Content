//
//  Movie.swift
//  MovieAppUIKit+Combine
//
//  Created by Salman_Macbook on 19/06/24.
//

import Foundation

struct MovieResponse: Decodable {
    let Search: [Movie]
}

struct Movie: Decodable {
    let title: String
    let year: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
    }
}
