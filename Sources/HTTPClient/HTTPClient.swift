//
//  WebRESTClient.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

internal protocol HTTPClient {
    func performOperation(parameters: HTTPOperationParameters,
                          completion: @escaping ((Result<JSON>) -> Void))
}

internal struct HTTPOperationParameters {
    let url: URL
    let method: HTTPMethod
}

internal enum HTTPMethod: String {
    case GET = "GET"
}
