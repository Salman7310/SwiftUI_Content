//
//  String+Extensions.swift
//  MovieApp_SwiftUI+Combine
//
//  Created by Salman_Macbook on 20/06/24.
//

import Foundation

extension String {
    
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
}
