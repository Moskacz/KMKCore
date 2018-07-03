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
