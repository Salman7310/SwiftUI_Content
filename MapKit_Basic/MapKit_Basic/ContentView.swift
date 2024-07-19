//
//  ContentView.swift
//  MapKit_Basic
//
//  Created by Salman_Macbook on 17/07/24.
//

import SwiftUI
import MapKit


struct ContentView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var selectedMapOption: MapOptions = .standard
    @State private var locationManager = LocationManager.shared
    
    private func openSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(position: $position) {
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
                
            }
            .mapControls({
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            })
            .onChange(of: locationManager.region) {
                withAnimation {
                    position = .region(locationManager.region)
                }
            }
            .mapStyle(selectedMapOption.mapStyle)
            
            .alert(isPresented: $locationManager.showingLocationAlert) {
                Alert(
                    title: Text("Location Access"),
                    message: Text("Please enable location access in Settings to use this feature."),
                    primaryButton: .default(Text("Settings"), action: {
                        openSettings()
                    }),
                    secondaryButton: .cancel()
                )
            }
            
            VStack {
                Spacer()
                
                Picker("Map Styles", selection: $selectedMapOption) {
                    ForEach(MapOptions.allCases) { mapOption in
                        Text(mapOption.rawValue.capitalized).tag(mapOption)
                    }
                }.pickerStyle(.segmented)
                    .background(.white)
                    .padding()
                
                HStack {
                    Button("Coffee") {
                        withAnimation {
                            position = .region(.coffee)
                        }
                    }.buttonStyle(.borderedProminent)
                        .tint(.brown)
                    
                    Button("Restaurent") {
                        withAnimation {
                            position = .region(.restaurant)
                        }
                    }.buttonStyle(.borderedProminent)
                        .tint(.orange)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
