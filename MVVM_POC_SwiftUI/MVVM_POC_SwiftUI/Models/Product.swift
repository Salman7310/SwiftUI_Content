//
//  Product.swift
//  MVVM_POC_SwiftUI
//
//  Created by Salman_Macbook on 15/05/24.
//

import Foundation

struct Product: Decodable {
    
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    
}
