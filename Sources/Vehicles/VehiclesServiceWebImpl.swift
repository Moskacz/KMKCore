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
    private let vehiclesURL: URL
    
    internal init(httpClient: HTTPClient, mapper: Mapper<JSON, Vehicle>, vehiclesURL: URL) {
        self.httpClient = httpClient
        self.mapper = mapper
        self.vehiclesURL = vehiclesURL
    }
    
    func getVehicles(completion: @escaping ((Result<[Vehicle]>) -> Void)) {
        httpClient.performOperation(parameters: HTTPOperationParameters(url: vehiclesURL, method: .GET)) { (result) in
            switch result {
            case .success(let json):
                do {
                    let jsons: [JSON] = try json.get(key: "vehicles")
                    let vehicles = jsons.compactMap { try? self.mapper.map(from: $0) }
                    completion(Result.success(vehicles))
                } catch {
                    completion(Result.failure(error))
                }
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
}
