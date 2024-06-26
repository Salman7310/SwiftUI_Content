//
//  BudgetListView.swift
//  BudgetApp_CoreData
//
//  Created by Salman_Macbook on 24/06/24.
//

import SwiftUI
import CoreData

struct BudgetListView: View {
    
    let budgetCategoryResults: FetchedResults<BudgetCategory>
    let onDeleteBudgetCategory: (BudgetCategory) -> Void  //Closure
    let onEditBudgetCategory: (BudgetCategory) -> Void //Closure
    
    var body: some View {
        NavigationStack {
            List {
                if !budgetCategoryResults.isEmpty {
                    ForEach(budgetCategoryResults) { budgetCategory in
                        NavigationLink(value: budgetCategory) {
                            HStack {
                                Text(budgetCategory.title ?? "")
                                Spacer()
                                VStack(alignment: .trailing, spacing: 10) {
                                    Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                                    Text("\(budgetCategory.overSpent ? "Overspent" : "Remaining") \(Text(budgetCategory.remainingBudgetTotal as NSNumber, formatter: NumberFormatter.currency))")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .fontWeight(.bold)
                                        .foregroundColor(budgetCategory.overSpent ? .red : .green)
                                }
                            }.contentShape(Rectangle())
                                .onLongPressGesture {
                                    onEditBudgetCategory(budgetCategory)
                                }
                        }
                    }.onDelete(perform: { indexSet in
                        indexSet.map { budgetCategoryResults[$0] }.forEach(onDeleteBudgetCategory)
                    })
                } else {
                    Text("No budget categories exists.")
                }
            }
            .listStyle(.automatic)
            .navigationDestination(for: BudgetCategory.self) { budgetCategory in
                BudgetDetailView(budgetCategory: budgetCategory)
            }
        }
    }
}

//#Preview {
//    BudgetListView(budgetCategoryResults: <#FetchedResults<BudgetCategory>#>, onDeleteBudgetCategory: <#(BudgetCategory) -> Void#>)
//}
