//
//  VehicleMapper.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

internal class VehicleMapper: Mapper<JSON, Vehicle> {
    
    override func map(from type: JSON) throws -> Vehicle {
        guard
            let categoryRaw: String = try type.get(key: "category"),
            let category = VehicleCategory(rawValue: categoryRaw) else {
                throw MappingError.couldNotMap(key: "category")
        }
        return VehicleImpl(id: try type.get(key: "id"),
                           category: category,
                           name: try type.get(key: "name"),
                           longitude: try type.get(key: "longitude"),
                           latitude: try type.get(key: "latitude"),
                           heading: try type.get(key: "heading"))
    }
}
