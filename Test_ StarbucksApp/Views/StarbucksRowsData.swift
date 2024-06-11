//
//  StarbucksRowsData.swift
//  Test_ StarbucksApp
//
//  Created by Salman_Macbook on 14/03/24.
//
                                
import SwiftUI

struct StarbucksRowsData: View {

    var starbucks: Starbucks
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(starbucks.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            HStack {
                Text("\(starbucks.distance) km")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    StarbucksRowsData(starbucks: starbucks[0])
}


// Explanation:-

/*This SwiftUI code defines a reusable view component called StarbucksRowsData that displays information about a Starbucks location. It takes in a Starbucks object as a parameter and displays the name of the Starbucks and its distance in kilometers.

Inside the body of the view, a VStack is used to stack the name of the Starbucks and its distance in a vertical layout. The name of the Starbucks is displayed with a title2 font size, bold weight, and black color. The distance is displayed in a smaller subheadline font size and a secondary color.

In the Preview section, an instance of the StarbucksRowsData view is created with the first Starbucks object from an array of Starbucks (starbucks[0]) passed in as a parameter. This preview allows developers to see a visual representation of how the StarbucksRowsData view will look like with sample data.*/
