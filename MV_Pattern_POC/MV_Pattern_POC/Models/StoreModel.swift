//
//  StoreModel.swift
//  MV_Pattern_POC
//
//  Created by Salman_Macbook on 21/05/24.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    let webservice: WebService
    @Published var products: [Product] = []
    
    init(webservice: WebService) {
        self.webservice = webservice
    }
    
    func populateProducts() async throws {
        products = try await webservice.getProducts()
    }
}

// Note:- Whenever you have a published property for a property wrapper, then we have to make sure we call that on the mail thread.

// Here @MainActor shows that products and the populateProducts() will be calling in the main thread.
