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
    
}

