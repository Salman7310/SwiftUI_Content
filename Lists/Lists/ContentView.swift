//
//  ContentView.swift
//  Lists
//
//  Created by Salman_Macbook on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = ""
    @State private var friends: [String] = []
    
    var body: some View {
        VStack {
            TextField("Enter Name", text: $name)
                .textFieldStyle(.roundedBorder)
            // OnSubmit is fire when user type and return from TF
                .onSubmit {
                friends.append(name)
                name = ""
            }
            
            List(friends, id: \.self) { friend in
                Text(friend)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
