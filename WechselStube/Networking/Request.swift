//
//  Request.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

struct Request {
    var path: String
    var method: HTTPMethod
    var contentType: String
    var queryParams: [String: String]?
    
    init(
        path: String,
        method: HTTPMethod = HTTPMethod.get,
        contentType: String = "application/json",
        queryParams: [String: String]?
    ) {
        self.path = path
        self.method = method
        self.contentType = contentType
        self.queryParams = queryParams
    }
}

extension Request {
    
    func asURLRequest(baseURL: String) -> URLRequest? {
        guard var urlComponents = URLComponents(string: baseURL) else { return nil }
        urlComponents.path = "\(urlComponents.path)\(path)"
        
        urlComponents.queryItems = queryParams.map {
            $0.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
        }
        
        guard let finalURL = urlComponents.url else { return nil }
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        return request
    }
    
    private func requestBodyFrom(params: [String: Any]?) -> Data? {
        guard let params = params else { return nil }
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return nil
        }
        return httpBody
    }
    
}
