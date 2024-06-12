//
//  CoffeeOrderApp_MV_patternApp.swift
//  CoffeeOrderApp_MV_pattern
//
//  Created by Salman_Macbook on 11/06/24.
//

import SwiftUI

@main
struct CoffeeOrderApp_MV_patternApp: App {
    
    @StateObject private var model: CoffeeModel
    
    init() {
        let webService = WebService()
        _model = StateObject(wrappedValue: CoffeeModel(webService: webService))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
