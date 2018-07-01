//
//  Vehicle.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

public protocol Vehicle {
    var id: String { get }
    var category: VehicleCategory { get }
    var name: String { get }
    var longitude: Int { get }
    var latitude: Int { get }
    var heading: Int { get }
}

public enum VehicleCategory {
    case tram
}
