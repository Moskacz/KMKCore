//
//  StopMapper.swift
//  KMKCore
//
//  Created by Michal Moskala on 03.07.2018.
//

import Foundation

internal class StopMapper: Mapper<JSON, Stop> {
    
    override func map(from type: JSON) throws -> Stop {
        guard
            let categoryRaw: String = try type.get(key: "category"),
            let category = StopCategory(rawValue: categoryRaw) else {
            throw MappingError.couldNotMap(key: "category")
        }
        
        return StopImpl(category: category,
                        id: try type.get(key: "id"),
                        latitude: try type.get(key: "latitude"),
                        longitude: try type.get(key: "longitude"),
                        name: try type.get(key: "name"),
                        shortName: try type.get(key: "shortName"))
    }
}
