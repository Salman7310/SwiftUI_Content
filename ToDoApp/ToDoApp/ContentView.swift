//
//  ContentView.swift
//  ToDoApp
//
//  Created by Salman_Macbook on 04/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<TodoItem>
    @State private var title: String = ""
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpace
    }
    
    private func saveTodoItem() {
        let todoItem = TodoItem(context: context)
        todoItem.title = title
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    private func updateTodoItem(_ todoItem: TodoItem) {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    private var pendingTodoItems: [TodoItem] {
        todoItems.filter { !$0.isCompleted }
    }
    
    private var completedTodoItem: [TodoItem] {
        todoItems.filter { $0.isCompleted }
    }
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    if isFormValid {
                        saveTodoItem()
                        title = ""
                    }
                }
            
            List {
                Section("Pending") {
                    ForEach(pendingTodoItems) { todoItem in
                        TodoCellView(todoItem: todoItem, onChanged: updateTodoItem)
                    }
                }
                
                Section("Completed") {
                    ForEach(completedTodoItem) { todoItem in
                        TodoCellView(todoItem: todoItem, onChanged: updateTodoItem)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Todo")
    }
}

struct TodoCellView: View {
    
    let todoItem: TodoItem
    let onChanged: (TodoItem) -> Void
    
    var body: some View {
        HStack {
            Image(systemName: todoItem.isCompleted ? "checkmark.square" : "square")
                .onTapGesture {
                    todoItem.isCompleted = !todoItem.isCompleted
                    onChanged(todoItem)
                }
            Text(todoItem.title ?? "")
        }
    }
}

#Preview {
    NavigationStack {
        ContentView().environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
    }
}
