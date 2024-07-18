//
//  ContentView.swift
//  MapKit_Basic
//
//  Created by Salman_Macbook on 17/07/24.
//

import SwiftUI
import MapKit


struct ContentView: View {
    
    @State private var selectedMapOption: MapOptions = .standard
    private var locationManager = LocationManager.shared
    
    var body: some View {
        ZStack(alignment: .top) {
            Map {
                /*Marker("Coffee", coordinate: .coffee)
                Marker("Restaurant", coordinate: .restaurant)*/
                Annotation("Coffee", coordinate: .coffee) {
                    Image(systemName: "cup.and.saucer.fill")
                        .padding(4)
                        .foregroundColor(.white)
                        .background(.indigo)
                        .cornerRadius(4.0)
                }
                
                Annotation("Restaurant", coordinate: .restaurant) {
                    Image(systemName: "fork.knife.circle")
                        .padding(4)
                        .foregroundColor(.white)
                        .background(.brown)
                        .cornerRadius(4.0)
                }
                
                UserAnnotation()
                
            }.mapStyle(selectedMapOption.mapStyle)
            
            Picker("Map Styles", selection: $selectedMapOption) {
                ForEach(MapOptions.allCases) { mapOption in
                    Text(mapOption.rawValue.capitalized).tag(mapOption)
                }
            }.pickerStyle(.segmented)
                .background(.white)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
