//
//  ContentView.swift
//  CoffeeOrderApp_MV_pattern
//
//  Created by Salman_Macbook on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var model: CoffeeModel
    
    private func populateOrders() async {
        do {
            try await model.populateOrders()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            List(model.orders) { order in
                OrderCellView(order: order)
            }
        }.task {
            await populateOrders()
        }
    }
}

#Preview {
    ContentView().environmentObject(CoffeeModel(webService: WebService()))
}

