//
//  Stop.swift
//  KMKCore
//
//  Created by Michal Moskala on 03.07.2018.
//

import Foundation

public protocol Stop {
    var id: String { get }
    var latitude: Int { get }
    var longitude: Int { get }
    var name: String { get }
    var shortName: String { get }
}

public enum StopCategory: String {
    case tram
}
