//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Salman_Macbook on 04/07/24.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    
    let provider = CoreDataProvider()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView().environment(\.managedObjectContext, provider.viewContext)
            }
        }
    }
}
