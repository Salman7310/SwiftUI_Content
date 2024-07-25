//
//  SearchbarView.swift
//  NearBy_App
//
//  Created by Salman_Macbook on 24/07/24.
//

import SwiftUI

struct SearchbarView: View {
    
    @Binding var search: String
    @Binding var isSearching: Bool
    
    var body: some View {
        VStack(spacing: -10) {
            TextField("Search", text: $search)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    // code fired when you click return in TextField
                    isSearching = true
                }
            
            SearchOptionsView { searchTerm in
                search = searchTerm
                isSearching = true
            }
            .padding([.leading], 10)
            .padding([.bottom], 10)
        }
    }
}

#Preview {
    SearchbarView(search: .constant("Coffee"), isSearching: .constant(true))
}
