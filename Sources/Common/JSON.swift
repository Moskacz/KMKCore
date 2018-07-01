//
//  JSON.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

internal typealias JSON = [String: Any]

extension Dictionary where Key == String, Value == Any {
    func get<T>(key: String) throws -> T {
        guard let value = self[key] else {
            throw MappingError.valueMissing(key: key)
        }
        if let typedValue = value as? T {
            return typedValue
        } else {
            throw MappingError.couldNotMap(key: key)
        }
    }
}
