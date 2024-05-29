//
//  ContentView.swift
//  Lists&Navigation
//
//  Created by Salman_Macbook on 09/05/24.
//

import SwiftUI

struct ContentView: View {
    
    var hikes = [Hike(name: "Advertise", photo: "aaron", miles: 56),
                 Hike(name: "Submit a Photo SSSSSSS", photo: "david", miles: 69.5),
                 Hike(name: "Exclusive start", photo: "aaron", miles: 256.0)]
    
    var body: some View {
        NavigationStack {
            List(hikes) { hike in
                NavigationLink(value: hike) {
                    HikeCellView(hike: hike)
                }
            }.navigationTitle("Hikes")
                .navigationDestination(for: Hike.self) { hike in
                    HikeDetailScreen(hike: hike)
                }
        }
    }
}

#Preview {
    ContentView()
}

struct HikeCellView: View {
    
    var hike: Hike
    
    var body: some View {
        HStack(alignment: .top) {
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                .frame(width: 100)
            
            VStack(alignment: .leading) {
                Text(hike.name)
                Text("\(hike.miles.formatted()) miles")
            }
            
        }
    }
}
