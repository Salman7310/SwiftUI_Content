//
//  BudgetCategory+CoreDataClass.swift
//  BudgetApp+CoreData+SwiftUI
//
//  Created by Salman_Macbook on 21/06/24.
//

import Foundation
import CoreData

@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
    
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
}
