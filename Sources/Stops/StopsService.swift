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
}

public protocol StopsService {
    func getStops(parameters: GetStopsParameters, completion: @escaping ((Result<[Stop]>) -> Void))
}
