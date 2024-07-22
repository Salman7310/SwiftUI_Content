//
//  ContentView.swift
//  NearBy_App
//
//  Created by Salman_Macbook on 19/07/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var query: String = ""
    @State private var selectedDetent: PresentationDetent = .fraction(0.15)
    @State private var locationManager = LocationManager.shared
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                UserAnnotation()
            }.onChange(of: locationManager.region, { // zoom
                withAnimation {
                    position = .region(locationManager.region)
                }
            })
                .sheet(isPresented: .constant(true), content: {
                    VStack {
                        TextField("Search", text: $query)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                            .onSubmit {
                                // code fired when you click return in TextField
                            }
                        
                        Spacer()
                    }
                    .presentationDetents([.fraction(0.15), .medium, .large], selection: $selectedDetent)
                    .presentationDragIndicator(.visible)
                    .interactiveDismissDisabled()
                    .presentationBackgroundInteraction(.enabled)
                })
        }
    }
}

#Preview {
    ContentView()
}
