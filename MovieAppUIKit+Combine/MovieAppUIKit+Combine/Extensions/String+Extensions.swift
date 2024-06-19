//
//  String+Extensions.swift
//  MovieAppUIKit+Combine
//
//  Created by Salman_Macbook on 19/06/24.
//

import Foundation

extension String {
    
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
}
