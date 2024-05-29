//
//  MV_Pattern_POCApp.swift
//  MV_Pattern_POC
//
//  Created by Salman_Macbook on 21/05/24.
//

import SwiftUI

@main
struct MV_Pattern_POCApp: App {
    
    @StateObject private var storeModel = StoreModel(webservice: WebService())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}
