//
//  AddCoffeeView.swift
//  CoffeeOrderApp_MV_pattern
//
//  Created by Salman_Macbook on 12/06/24.
//

import SwiftUI

struct AddCoffeeErrors {
    var name: String = ""
    var coffeeName: String = ""
    var price: String = ""
}

struct AddCoffeeView: View {
    
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var price: String = ""
    @State private var coffeeSize: CoffeeSize = .medium
    @State private var errors: AddCoffeeErrors = AddCoffeeErrors()
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var model: CoffeeModel
    
    var isValid: Bool {
        
        errors = AddCoffeeErrors()
        
        // This is NOT a business rule
        // This is just UI validation
        if name.isEmpty {
            errors.name = "Name cannot be empty!"
        }
        
        if coffeeName.isEmpty {
            errors.coffeeName = "Coffee name cannot be empty!"
        }
        
        if price.isEmpty {
            errors.price = "Price name cannot be empty!"
        } else if !price.isNumeric {
            errors.price = "Price needs to be a number!"
        } else if price.isLessThan(1) {
            errors.price = "Price needs to be more than 0"
        }
        
        return errors.name.isEmpty && errors.coffeeName.isEmpty && errors.price.isEmpty
    }
    
    private func placeOrder() async {
        
        let order = Order(name: name, coffeeName: coffeeName, total: Double(price) ?? 0, size: coffeeSize)
        
        do {
            try await model.placeOrder(order)
            // Once Order is placed the Dismiss the view
            dismiss()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $name).accessibilityIdentifier("name")
            Text(errors.name).visible(errors.name.isNotEmpty)
                .font(.caption)
                .foregroundColor(.red)
            
            TextField("Coffee name", text: $coffeeName).accessibilityIdentifier("coffeeName")
            Text(errors.coffeeName).visible(errors.coffeeName.isNotEmpty)
                .font(.caption)
                .foregroundColor(.red)
            
            TextField("Price", text: $price).accessibilityIdentifier("price")
            Text(errors.price).visible(errors.price.isNotEmpty)
                .font(.caption)
                .foregroundColor(.red)
            
            Picker("Select size", selection: $coffeeSize) {
                ForEach(CoffeeSize.allCases, id: \.rawValue) { size in
                    Text(size.rawValue).tag(size)
                }
            }.pickerStyle(.segmented)
            
            Button("Place order") {
                if isValid {
                    // place the order
                    Task {
                        await placeOrder()
                    }
                }
            }.accessibilityIdentifier("placeOrderButton")
                .centerHorizontally()
        }
    }
}

#Preview {
    AddCoffeeView()
}
