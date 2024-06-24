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
    
    var body: some View {
        List {
            if !budgetCategoryResults.isEmpty {
                ForEach(budgetCategoryResults) { budgetCategory in
                    HStack {
                        Text(budgetCategory.title ?? "")
                        Spacer()
                        VStack {
                            Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                        }
                    }
                }.onDelete(perform: { indexSet in
                    indexSet.map { budgetCategoryResults[$0] }.forEach(onDeleteBudgetCategory)
                })
            } else {
                Text("No budget categories exists.")
            }
        }
    }
}

//#Preview {
//    BudgetListView(budgetCategoryResults: <#FetchedResults<BudgetCategory>#>, onDeleteBudgetCategory: <#(BudgetCategory) -> Void#>)
//}
