//
//  HTTPClient.swift
//  MovieAppUIKit+Combine
//
//  Created by Salman_Macbook on 19/06/24.
//

import Foundation
import Combine

enum NetworkError: Error {
    case badUrl
}

class HTTPClient {
    
    func fetchMovie(searchString: String) -> AnyPublisher<[Movie], Error> {
        
        guard let encodedSearch = searchString.urlEncoded, 
                let url = URL(string: "https://www.omdbapi.com/?s=\(encodedSearch)&page=2&apiKey=3f67dbb0")
        else {
            // Its a Publisher, that's why retrun Fail in else block.
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map(\.Search)
            .receive(on: DispatchQueue.main)
            .catch { error -> AnyPublisher<[Movie], Error> in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
