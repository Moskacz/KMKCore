//
//  Mapper.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

internal enum MappingError: Error, Equatable {
    case valueMissing(key: String)
    case couldNotMap(key: String)
}

internal class Mapper<Income, Outcome> {
    func map(from type: Income) throws -> Outcome {
        fatalError("abstract method called!")
    }
}
