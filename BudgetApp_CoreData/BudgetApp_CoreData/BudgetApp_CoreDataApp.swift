//
//  BudgetApp_CoreDataApp.swift
//  BudgetApp_CoreData
//
//  Created by Salman_Macbook on 24/06/24.
//

import SwiftUI

@main
struct BudgetApp_CoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
