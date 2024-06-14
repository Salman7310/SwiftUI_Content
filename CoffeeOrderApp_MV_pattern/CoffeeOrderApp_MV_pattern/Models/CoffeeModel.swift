//
//  CoffeeModel.swift
//  CoffeeOrderApp_MV_pattern
//
//  Created by Salman_Macbook on 12/06/24.
//

import Foundation

@MainActor
class CoffeeModel: ObservableObject {
    
    let webService: WebService
    @Published private(set) var orders: [Order] = []
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func populateOrders() async throws {
        orders = try await webService.getOrders()
    }
    
    func placeOrder(_ order: Order) async throws {
        let newOrder = try await webService.placeOrder(order: order)
        orders.append(newOrder)
    }
    
    func deleteOrder(_ orderId: Int) async throws {
        let deletedOrder = try await webService.deleteOrder(orderId: orderId)
        orders = orders.filter { $0.id != deletedOrder.id }
    }
}
