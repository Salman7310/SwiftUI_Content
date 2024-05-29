//
//  SignupHttpClient.swift
//  SignupForm_POC
//
//  Created by Salman_Macbook on 24/05/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

struct SignupHttpClient {
    
    func signupHttpRequest(_ apiName: String, user: User?) async throws -> User? {
        debugPrint(user)  // This user is to be senf over server while using real API
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .apiName(apiName)))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let users = try JSONDecoder().decode([User].self, from: data)
        debugPrint(users)
        return users.first
    }
}
