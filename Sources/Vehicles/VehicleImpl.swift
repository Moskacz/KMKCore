//
//  VehicleImpl.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

internal struct VehicleImpl: Vehicle {
    let id: String
    let category: VehicleCategory
    let name: String
    let longitude: Int
    let latitude: Int
    let heading: Int
}
