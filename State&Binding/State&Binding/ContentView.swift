//
//  ContentView.swift
//  State&Binding
//
//  Created by Salman_Macbook on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter: Int = 0
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello, world!")
            Text("\(counter)").font(.largeTitle)
            Button("Increment") {
                counter += 1
            }
            Button("Decrement") {
                counter -= 1
                if counter < 0 {
                    counter = 0
                }
            }
            
            // Another Example
            Toggle(isOn: $isOn, label: {
                Text(isOn ? "ON" : "OFF")
            }).fixedSize()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isOn ? .yellow : .green)
    }
}

#Preview {
    ContentView()
}
