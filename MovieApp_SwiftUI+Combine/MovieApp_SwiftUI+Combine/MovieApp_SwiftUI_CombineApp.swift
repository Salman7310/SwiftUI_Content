//
//  MovieApp_SwiftUI_CombineApp.swift
//  MovieApp_SwiftUI+Combine
//
//  Created by Salman_Macbook on 20/06/24.
//

import SwiftUI

@main
struct MovieApp_SwiftUI_CombineApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(httpClient: HTTPClient())
        }
    }
}
