//
//  BudgetCategory+CoreDataClass.swift
//  BudgetApp_CoreData
//
//  Created by Salman_Macbook on 24/06/24.
//

import Foundation
import CoreData

@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
    
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
    
    
    private var transactionsArray: [Transaction] {
        guard let transaction = transaction else { return [] }
        let allTransactions = (transaction.allObjects as? [Transaction]) ?? []
        return allTransactions.sorted { t1, t2 in
            t1.dateCreated! < t2.dateCreated!
        }
    }
    
    var transactionTotal: Double {
        transactionsArray.reduce(0) { result, transaction in
            result + transaction.total
        }
    }
    
    var remainingBudgetTotal: Double {
        self.total - transactionTotal
    }
    
    var overSpent: Bool {
        remainingBudgetTotal < 0
    }
    
    static func transactionByCategoryRequest(_ budgetCategory: BudgetCategory) -> NSFetchRequest<Transaction> {
        let request = Transaction.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        request.predicate = NSPredicate(format: "category = %@", budgetCategory)
        return request
    }
    
}

