//
//  StarbucksLocation.swift
//  Test_ StarbucksApp
//
//  Created by Salman_Macbook on 14/03/24.
//

import SwiftUI

struct StarbucksLocation: View {

    var starbucks: Starbucks

    var body: some View {
        ZStack {
            MapViewContent(coordinate: starbucks.locationCoordinate)
        }
        .navigationTitle(starbucks.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StarbucksLocation(starbucks: starbucks[0])
}

// Explanation

/*This SwiftUI code defines a View called StarbucksLocation, which takes in a Starbucks object as a parameter. Inside the body property, it uses a ZStack to overlay views on top of each other. In this case, it adds a MapViewContent view with a specific coordinate based on the Starbucks location.

The navigationTitle modifier is used to set the title of the navigation bar to the name of the Starbucks location. The navigationBarTitleDisplayMode modifier is used to specify that the title should be displayed inline, meaning it will be displayed within the navigation bar instead of being pushed up when scrolling.

In the Preview section, an instance of the StarbucksLocation view is created with the first Starbucks object from an array called starbucks. This allows us to see a preview of how the StarbucksLocation view will look with a specific Starbucks location.*/
