//
//  ContentView.swift
//  MVVM_POC_SwiftUI
//
//  Created by Salman_Macbook on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ProductListViewModel(webService: Webservice())
    
    var body: some View {
        VStack {
            List(vm.products) { product in
                Text("Product Id: \(product.id)")
                Text("Title: \(product.title)")
                Text("Category: \(product.category)")
                Text("Price: \(product.price)")
                Text("Description: \(product.description)")
//                Image(product.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            }.task {
                await vm.populateProducts()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
