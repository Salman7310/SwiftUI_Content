//
//  EnvironmentObject_POCApp.swift
//  EnvironmentObject_POC
//
//  Created by Salman_Macbook on 13/05/24.
//

import SwiftUI

@main
struct EnvironmentObject_POCApp: App {
    
//    @StateObject private var appState = AppState() // Before iOS 17
    @State private var appState = AppState() // From iOS 17
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environmentObject(appState) // Before iOS 17
                .environment(AppState()) // From iOS 17
        }
    }
}
