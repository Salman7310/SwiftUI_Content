//
//  ContentView.swift
//  MovieApp_SwiftUI+Combine
//
//  Created by Salman_Macbook on 20/06/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var movies: [Movie] = []
    @State private var search: String = ""
    
    //Subject
    let searchSubject = CurrentValueSubject<String, Never>("")
    @State private var cancellable: Set<AnyCancellable> = []
    
    private let httpClient: HTTPClient
    
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func setupSearchPublisher() {
        searchSubject
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { searchText in
                loadMovies(search: searchText)
            }.store(in: &cancellable)
    }
    
    private func loadMovies(search: String) {
        httpClient.fetchMovie(search: search)
            .sink { _ in
                
            } receiveValue: { movie in
                self.movies = movie
            }.store(in: &cancellable) // Here subscription will be lost if we doesn't store
    }
    
    var body: some View {
        NavigationStack {
            List(movies) { movie in
                HStack {
                    AsyncImage(url: movie.poster) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(movie.title)
                }
            }
            .onAppear {
                setupSearchPublisher()
            }
            
            .searchable(text: $search)
            .onChange(of: search) {
                // Publish the subject. It need to subscribe somewhere
                searchSubject.send(search)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView(httpClient: HTTPClient())
    }
}
