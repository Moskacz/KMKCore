//
//  FakeMapper.swift
//  KMKCoreiOSTests
//
//  Created by Michal Moskala on 02.07.2018.
//

import Foundation
@testable import KMKCore

internal class FakeMapper<Income, Outcome>: Mapper<Income, Outcome> {
    
    var passedType: Income?
    var errorToThrow: Error?
    var outcomeToReturn: Outcome?
    
    override func map(from type: Income) throws -> Outcome {
        passedType = type
        if errorToThrow != nil {
            throw errorToThrow!
        }
        return outcomeToReturn!
    }
}
