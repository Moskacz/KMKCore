//
//  VehiclesServiceWebImpl.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

internal class VehiclesServiceWebImpl: VehiclesService {
    
    private let httpClient: HTTPClient
    private let mapper: Mapper<JSON, Vehicle>
    
    internal init(httpClient: HTTPClient, mapper: Mapper<JSON, Vehicle>) {
        self.httpClient = httpClient
        self.mapper = mapper
    }
    
    func getVehicles(completion: @escaping ((Result<[Vehicle]>) -> Void)) {
        
    }
}
