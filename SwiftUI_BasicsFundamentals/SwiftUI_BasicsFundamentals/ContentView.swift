//
//  ContentView.swift
//  SwiftUI_BasicsFundamentals
//
//  Created by Salman_Macbook on 09/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("aaron-burden-unsplash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            
            // Image from Server
            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1485970247670-34cd80f5a996?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!) { image in
                image.resizable()
            } placeholder: {
                ProgressView("Downloading")
            }
            
            Text("Text 1")
                .foregroundStyle(.cyan)
            Text("Text 2")
                .foregroundStyle(.green)
            Text("Text 3")
            
            HStack {
                Text("Left Text")
                Text("Right Text")
                    .fontWeight(.heavy)
            }
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

#Preview {
    ContentView()
}
