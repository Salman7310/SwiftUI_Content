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
            if model.orders.isEmpty {
                Text("No orders available!").accessibilityIdentifier("noOrdersText")
            } else {
                List(model.orders) { order in
                    OrderCellView(order: order)
                }
            }
        }.task {
            await populateOrders()
        }
    }
}

//#Preview {
//    var config = Configuration()
//    ContentView().environmentObject(CoffeeModel(webService: WebService(baseURL: config.environment.baseURL)))
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var config = Configuration()
        ContentView().environmentObject(CoffeeModel(webService: WebService(baseURL: config.environment.baseURL)))
    }
}
