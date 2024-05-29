//
//  ProductListViewModel.swift
//  MVVM_POC_SwiftUI
//
//  Created by Salman_Macbook on 15/05/24.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    let webService: Webservice
    
    init(webService: Webservice) {
        self.webService = webService
    }
    
    func populateProducts() async {
        do {
            let products = try await webService.getProducts()
            self.products = products.map(ProductViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct ProductViewModel: Identifiable {
    private var product: Product
    
    init(products: Product) {
        self.product = products
    }
    
    var id: Int {
        product.id
    }
    
    var title: String {
        product.title
    }
    
    var price: Double {
        product.price
    }
    
    var description: String {
        product.description
    }
    
    var category: String {
        product.category
    }
    
    var image: String {
        product.image
    }
}
