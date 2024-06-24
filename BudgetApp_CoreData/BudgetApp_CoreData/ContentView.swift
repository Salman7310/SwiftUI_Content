//
//  ContentView.swift
//  BudgetApp_CoreData
//
//  Created by Salman_Macbook on 24/06/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var budgetCategoryResults: FetchedResults<BudgetCategory>
    @State private var isPresented: Bool = false
    
    var total: Double {
        budgetCategoryResults.reduce(0) { result, budgetCategory in
            return result + budgetCategory.total
        }
    }
    
    private func deleteBudgetCategory(budgetCategory: BudgetCategory) {
        // Perform delete for selected element
        viewContext.delete(budgetCategory)
        
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text(total as NSNumber, formatter: NumberFormatter.currency).fontWeight(.bold)
                    .foregroundColor(.green)
                
                BudgetListView(budgetCategoryResults: budgetCategoryResults, onDeleteBudgetCategory: { budgetCategory in
                    deleteBudgetCategory(budgetCategory: budgetCategory)
                })
            }
            .sheet(isPresented: $isPresented, content: {
                AddBudgetCategoryView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Category") {
                        isPresented = true
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
}
