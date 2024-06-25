//
//  BudgetSummaryView.swift
//  BudgetApp_CoreData
//
//  Created by Salman_Macbook on 25/06/24.
//

import SwiftUI

struct BudgetSummaryView: View {
    
    @ObservedObject  var budgetCategory: BudgetCategory
    
    var body: some View {
        VStack {
            Text("\(budgetCategory.overSpent ? "Overspent" : "Remaining") \(Text(budgetCategory.remainingBudgetTotal as NSNumber, formatter: NumberFormatter.currency))")
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundColor(budgetCategory.overSpent ? .red : .green)
        }
    }
}

//#Preview {
//    BudgetSummaryView()
//}
