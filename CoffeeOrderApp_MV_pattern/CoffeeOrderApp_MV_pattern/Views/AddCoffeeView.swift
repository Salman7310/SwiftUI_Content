//
//  AddCoffeeView.swift
//  CoffeeOrderApp_MV_pattern
//
//  Created by Salman_Macbook on 12/06/24.
//

import SwiftUI

struct AddCoffeeView: View {
    
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var price: String = ""
    @State private var coffeeSize: CoffeeSize = .medium
    
    var body: some View {
        Form {
            TextField("Name", text: $name).accessibilityIdentifier("name")
            TextField("Coffee name", text: $coffeeName).accessibilityIdentifier("coffeeName")
            TextField("Price", text: $price).accessibilityIdentifier("price")
            
            Picker("Select size", selection: $coffeeSize) {
                ForEach(CoffeeSize.allCases, id: \.rawValue) { size in
                    Text(size.rawValue).tag(size)
                }
            }.pickerStyle(.segmented)
            
            Button("Place order") {
                
            }.accessibilityIdentifier("placeOrderButton")
                .centerHorizontally()
        }
    }
}

#Preview {
    AddCoffeeView()
}
