//
//  VehiclesService.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

public protocol VehiclesService {
    func getVehicles(completion: @escaping (([Vehicle]) -> Void))
}
