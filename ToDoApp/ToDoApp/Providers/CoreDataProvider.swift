//
//  CoreDataProvider.swift
//  ToDoApp
//
//  Created by Salman_Macbook on 04/07/24.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init(inMemory: Bool = false) {
        
        persistentContainer = NSPersistentContainer(name: "TodoModel")
        
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Core Data store failed to initialize \(error)")
            }
        }
    }
    
    // create the preview
    static var preview: CoreDataProvider {
        
        let provider = CoreDataProvider(inMemory: true)
        let viewContext = provider.viewContext
        
        // put some dummy data because when coredata provider initilizes it will load the data and if data is nill then app will be crashing.
        for index in 1..<10 {
            let todoItem = TodoItem(context: viewContext)
            todoItem.title = "todoItem \(index)"
            todoItem.isCompleted = index % 2 == 0 ? true : false
        }
        
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
        
        return provider
    }
}
