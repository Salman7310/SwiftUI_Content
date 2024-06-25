//
//  TransactionListView.swift
//  BudgetApp_CoreData
//
//  Created by Salman_Macbook on 25/06/24.
//

import SwiftUI
import CoreData

struct TransactionListView: View {
    
    @FetchRequest var transactions: FetchedResults<Transaction>
    // Closure to pass value to ParentView when deleting a transaction
    let onDeleteTransaction: (Transaction) -> Void
    
    init(request: NSFetchRequest<Transaction>, onDeleteTransaction: @escaping (Transaction) -> Void) { // escaping for future use
        _transactions = FetchRequest(fetchRequest: request)
        self.onDeleteTransaction = onDeleteTransaction
    }
    
    var body: some View {
        if transactions.isEmpty {
            Text("No transactions.")
        } else {
            List {
                ForEach(transactions) { transaction in
                    HStack {
                        Text(transaction.title ?? "")
                        Spacer()
                        Text(transaction.total as NSNumber, formatter: NumberFormatter.currency)
                    }
                }.onDelete { indexSet in
                    indexSet.map { transactions[$0] }.forEach(onDeleteTransaction)
                }
            }
        }
    }
}

//#Preview {
//    TransactionListView()
//}
