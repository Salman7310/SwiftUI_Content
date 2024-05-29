//
//  APIEndpoint.swift
//  SignupForm_POC
//
//  Created by Salman_Macbook on 24/05/24.
//

import Foundation

enum APIEndpoint {
    
    static let baseURL = "https://fakestoreapi.com"
    
    case apiName(String)
    
    private var path: String {
        switch self {
        case .apiName(let apiName):
            return "/\(apiName)"
        }
    }
    
    static func endpointURL(for endpoint: APIEndpoint) -> URL {
        let endpointPath = endpoint.path
        return URL(string: baseURL + endpointPath)!
    }
    
}
