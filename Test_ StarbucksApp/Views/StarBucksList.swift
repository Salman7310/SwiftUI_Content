//
//  StarBucksList.swift
//  Test_ StarbucksApp
//
//  Created by Salman_Macbook on 14/03/24.
//
                                
import SwiftUI

struct StarBucksList: View {
    var body: some View {
        NavigationStack {
            List(starbucks) { (data) in 
                NavigationLink {
                    StarbucksLocation(starbucks: data)
                    
                } label: {
                    StarbucksRowsData(starbucks: data)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Starbucks Outlet")
        }
    }
}

#Preview {
    StarBucksList()
}

// Explanation:-

/*This SwiftUI code defines a struct called StarBucksList that creates a list of Starbucks locations. Inside the body of the struct, it uses the NavigationStack to create a list of Starbucks locations using the data provided in the starbucks array. Each item in the list is represented by a NavigationLink that navigates to a StarbucksLocation view when clicked, passing the data of the specific Starbucks location. The label of each NavigationLink is defined by the StarbucksRowsData view, which displays the data of the Starbucks location.

The list is styled to be plain and has a navigation title of "Starbucks Outlet".

The code also includes a preview of the StarBucksList view by calling the StarBucksList() function. This preview allows the developer to see how the view will look like in the SwiftUI canvas.*/
