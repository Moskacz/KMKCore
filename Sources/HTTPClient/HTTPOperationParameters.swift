//
//  HTTPOperationParameters.swift
//  KMKCore
//
//  Created by Michal Moskala on 03.07.2018.
//

import Foundation

internal struct HTTPOperationParameters {
    private(set) var urlComponents: URLComponents?
    let method: HTTPMethod
    
    internal init(url: String, method: HTTPMethod, queryItems: [URLQueryItem]? = nil) {
        self.urlComponents = URLComponents(string: url)
        self.method = method
        self.urlComponents?.queryItems = queryItems
    }
    
    var urlRequest: URLRequest? {
        guard let url = urlComponents?.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}

internal enum HTTPMethod: String {
    case GET = "GET"
}
