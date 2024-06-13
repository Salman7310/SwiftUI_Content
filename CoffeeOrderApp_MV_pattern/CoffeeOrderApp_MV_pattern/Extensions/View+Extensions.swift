//
//  View+Extensions.swift
//  CoffeeOrderApp_MV_pattern
//
//  Created by Salman_Macbook on 12/06/24.
//

import Foundation
import SwiftUI

extension View {
    
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
}

