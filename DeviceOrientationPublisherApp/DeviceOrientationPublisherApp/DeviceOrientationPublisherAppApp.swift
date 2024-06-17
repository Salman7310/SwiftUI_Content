//
//  DeviceOrientationPublisherAppApp.swift
//  DeviceOrientationPublisherApp
//
//  Created by Salman_Macbook on 17/06/24.
//

import SwiftUI
import Combine

@main
struct DeviceOrientationPublisherAppApp: App {
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { _ in
            let currentOrientation = UIDevice.current.orientation
            print(currentOrientation)
            }.store(in: &cancellables)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
