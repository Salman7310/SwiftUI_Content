//
//  Transaction+CoreDataClass.swift
//  BudgetApp_CoreData
//
//  Created by Salman_Macbook on 25/06/24.
//

import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {
    
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
    
}
