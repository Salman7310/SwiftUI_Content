//
//  ContentView.swift
//  LearnApp
//
//  Created by Salman_Macbook on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var friends = ["John", "Smith", "Laika", "Sam", "Head"]
    @State private var search: String = ""
    @State private var filteredFriends: [String] = []
    
    var body: some View {
        VStack {
            List(filteredFriends, id: \.self) { friend in
                Text(friend)
            }
            .listStyle(.plain)
            
            .searchable(text: $search)
            .onChange(of: search) {
                if search.isEmpty {
                    filteredFriends = friends
                } else {
                    filteredFriends = friends.filter { $0.contains(search)}
                }
            }
            
            Spacer()
        }
        .onAppear() {
            filteredFriends = friends
        }
        .padding()
        .navigationTitle("Friends")
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
