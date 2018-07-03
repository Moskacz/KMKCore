//
//  URLSessionRESTClient.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

extension URLSession: HTTPClient {
    
    func performOperation(parameters: HTTPOperationParameters, completion: @escaping ((Result<JSON>) -> Void)) {
        guard let request = parameters.urlRequest else {
            completion(Result.failure(HTTPOperationError.invalidParameters(parameters)))
            return
        }
        
        let task = dataTask(with: request) { (data, response, error) in
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


