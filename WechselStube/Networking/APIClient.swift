//
//  APIClient.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation
import Combine

enum WechselError: Error {
    case networkError
}

struct APIClient {
    
    var baseURL: String
    let session: URLSession
    
    init(baseURL: String,
         session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }
    
}

extension APIClient {
    func dispatch<ReturnType: Decodable>(request: Request) -> AnyPublisher<ReturnType, WechselError> {
        guard let urlRequest = request.asURLRequest(baseURL: baseURL) else {
            return Empty().eraseToAnyPublisher()
        }
        
        return session
            .dataTaskPublisher(for: urlRequest)
            .tryMap { $0.data }
            .decode(type: ReturnType.self, decoder: JSONDecoder())
            .mapError { _ in .networkError }
            .eraseToAnyPublisher()
    }
}
