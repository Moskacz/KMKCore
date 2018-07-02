//
//  HTTPClientFake.swift
//  KMKCoreiOSTests
//
//  Created by Michal Moskala on 02.07.2018.
//

import Foundation
@testable import KMKCore

internal class HTTPClientFake: HTTPClient {
    
    var passedParameters: HTTPOperationParameters?
    var passedCompletionBlock: ((Result<JSON>) -> Void)?
    
    func performOperation(parameters: HTTPOperationParameters, completion: @escaping ((Result<JSON>) -> Void)) {
        passedParameters = parameters
        passedCompletionBlock = completion
    }
}
