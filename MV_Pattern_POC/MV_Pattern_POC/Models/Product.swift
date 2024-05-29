//
//  Product.swift
//  MV_Pattern_POC
//
//  Created by Salman_Macbook on 21/05/24.
//

import Foundation

struct Product: Decodable, Identifiable {
    
    let id: Int
    let title: String
    let price: Double
}
