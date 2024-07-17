//
//  ContentView.swift
//  MapKit_Basic
//
//  Created by Salman_Macbook on 17/07/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    
    static var coffee: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 22.645856611521666, longitude: 75.83350840210656)
    }
   
    static var restaurant: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 22.64661251468227, longitude: 75.8268113543925)
    }
}

enum MapOptions: String, Identifiable, CaseIterable {
    
    case standard
    case hybrid
    case imagery
    
    var id: String {
        self.rawValue
    }
    
    var mapStyle: MapStyle {
        switch self {
        case .standard:
            return .standard
        case .hybrid:
            return .hybrid
        case .imagery:
            return .imagery
        }
    }
}

struct ContentView: View {
    
    @State private var selectedMapOption: MapOptions = .standard
    
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
