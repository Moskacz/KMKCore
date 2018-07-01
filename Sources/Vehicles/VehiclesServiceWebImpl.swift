//
//  VehiclesServiceWebImpl.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

internal class VehiclesServiceWebImpl: VehiclesService {
    
    func getVehicles(completion: @escaping (([Vehicle]) -> Void)) {
        completion([])
    }
}
