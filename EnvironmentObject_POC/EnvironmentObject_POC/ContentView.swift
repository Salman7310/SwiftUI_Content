//
//  ContentView.swift
//  EnvironmentObject_POC
//
//  Created by Salman_Macbook on 13/05/24.
//

import SwiftUI
import Observation

/*// Pre iOS 17
class AppState: ObservableObject {
    @Published var isOn: Bool = false
}*/

// From iOS 17
@Observable
class AppState {
    var isOn: Bool = false
}

struct LightBulbView: View {
    
    //    @EnvironmentObject private var appState: AppState // Before iOS 17
    // How to use Environment
    @Environment(AppState.self) private var appState: AppState // From iOS 17
    
    var body: some View {
        
        @Bindable var appState = appState
        
        VStack {
            Image(systemName: appState.isOn ? "lightbulb.fill" : "lightbulb")
                .font(.largeTitle)
                .foregroundStyle(appState.isOn ? .yellow : .black)
            /*Button("Toggle") {
                appState.isOn.toggle()
            }*/
            
            Toggle("isOn", isOn: $appState.isOn)
        }
    }
}

struct LightRoomView: View {
    var body: some View {
        LightBulbView()
    }
}

struct ContentView: View {
    
//    @EnvironmentObject private var appState: AppState // Before iOS 17
    // How to use Environment
    @Environment(AppState.self) private var appState: AppState // From iOS 17
    
    var body: some View {
        VStack {
            LightRoomView()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(appState.isOn ? .black : .white)
    }
}

#Preview {
    ContentView()
        //.environmentObject(AppState()) // Before iOS 17
        .environment(AppState()) // From iOS 17
}
