//
//  StopsService.swift
//  KMKCore
//
//  Created by Michal Moskala on 03.07.2018.
//

import Foundation

public struct GetStopsParameters {
    let left: Int
    let right: Int
    let top: Int
    let bottom: Int
    
    internal var queryItems: [URLQueryItem] {
        return [("left", left), ("right", right), ("top", top), ("bottom",bottom)].map {
            URLQueryItem(name: $0.0, value: "\($0.1)")
        }
    }
}

public protocol StopsService {
    func getStops(parameters: GetStopsParameters, completion: @escaping ((Result<[Stop]>) -> Void))
}
