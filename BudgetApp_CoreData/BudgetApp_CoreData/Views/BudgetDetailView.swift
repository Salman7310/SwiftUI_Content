//
//  BudgetDetailView.swift
//  BudgetApp_CoreData
//
//  Created by Salman_Macbook on 25/06/24.
//

import SwiftUI

struct BudgetDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var title: String = ""
    @State private var total: String = ""
    
    let budgetCategory: BudgetCategory
    
    var isFormValid: Bool {
        guard let totalAsDouble = Double(total) else { return false }
        return !title.isEmpty && !total.isEmpty && totalAsDouble > 0
    }
    
    private func saveTransaction() {
        
        do {
            let transaction = Transaction(context: viewContext)
            transaction.title = title
            transaction.total = Double(total)!
            
            // Creating relationship
            budgetCategory.addToTransaction(transaction)
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(budgetCategory.title ?? "")
                .font(.largeTitle)
            HStack {
                Text("Budget:")
                Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
            }
            .fontWeight(.bold)
            
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Total", text: $total)
                } header: {
                    Text("Add Transaction")
                }
                
                HStack {
                    Spacer()
                    Button("Save Transaction") {
                        // save transaction
                        saveTransaction()
                    }.disabled(!isFormValid)
                    Spacer()
                }
            }
            
            // Display summary of the budget category
            BudgetSummaryView(budgetCategory: budgetCategory)
            
            // Display the transaction
            TransactionListView(request: BudgetCategory.transactionByCategoryRequest(budgetCategory))
            
            Spacer()
        }
    }
}

//#Preview {
//    BudgetDetailView(budgetCategory: BudgetCategory())
//}
