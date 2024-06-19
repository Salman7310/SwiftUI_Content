//
//  MovieListViewModel.swift
//  MovieAppUIKit+Combine
//
//  Created by Salman_Macbook on 19/06/24.
//

import Foundation
import Combine

class MovieListViewModel {
    
    @Published private(set) var movies: [Movie] = []
    @Published var loadingCompleted: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    
    // Create CurrentValueSubject because it retain or hold last value, So it's helpful while user type charecter in search bar and make the debounce technique smoother
    private var searchSubject = CurrentValueSubject<String, Never>("")
    
    private let httpClient: HTTPClient
    
    // Dependency Injection of httpClient
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
        setupSearchPublisher()
    }
    
    private func setupSearchPublisher() {
        searchSubject
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.loadMovies(searchString: searchText)
            }.store(in: &cancellables)
    }
    
    func setSearchText(searchString: String) {
        // Publish the value, So it needs to subscribe somewhere
        searchSubject.send(searchString)
    }
    
    func loadMovies(searchString: String) {
        httpClient.fetchMovie(searchString: searchString)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.loadingCompleted = true
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] movie in
                self?.movies = movie
            }.store(in: &cancellables) // We store the value bcoz once code block end data gone
    }
}
