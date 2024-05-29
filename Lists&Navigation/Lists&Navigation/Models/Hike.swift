//
//  Hike.swift
//  Lists&Navigation
//
//  Created by Salman_Macbook on 09/05/24.
//

import Foundation

struct Hike: Identifiable, Hashable {
    
    var id = UUID()
    var name: String
    var photo: String
    var miles: Double
    
}
