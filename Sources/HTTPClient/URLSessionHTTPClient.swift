//
//  URLSessionRESTClient.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

extension URLSession: HTTPClient {
    
    func performOperation(parameters: HTTPOperationParameters, completion: @escaping ((Result<JSON>) -> Void)) {
        let task = dataTask(with: parameters.urlRequest) { (data, response, error) in
            if let operationError = error {
                completion(Result.failure(operationError))
            }
            
            if let responseData = data {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? JSON else {
                        completion(Result.failure(HTTPOperationError.invalidResponse))
                        return
                    }
                    completion(Result.success(json))
                } catch {
                    completion(Result.failure(HTTPOperationError.invalidResponse))
                }
            }
            completion(Result.failure(HTTPOperationError.invalidResponse))
        }
        
        task.resume()
    }
}

extension HTTPOperationParameters {
    var urlRequest: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
