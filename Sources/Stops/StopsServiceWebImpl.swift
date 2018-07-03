//
//  StopsServiceWebImpl.swift
//  KMKCore
//
//  Created by Michal Moskala on 03.07.2018.
//

import Foundation

internal class StopsServiceWebImpl: StopsService {
    
    private let httpClient: HTTPClient
    private let mapper: Mapper<JSON, Stop>
    private let url: String
    
    internal init(httpClient: HTTPClient, mapper: Mapper<JSON, Stop>, url: String) {
        self.httpClient = httpClient
        self.mapper = mapper
        self.url = url
    }

    func getStops(parameters: GetStopsParameters, completion: @escaping ((Result<[Stop]>) -> Void)) {
        let operationParameters = HTTPOperationParameters(url: url, method: .GET, queryItems: parameters.queryItems)
        httpClient.performOperation(parameters: operationParameters) { result in
            switch result {
            case .failure(let error):
                completion(Result.failure(error))
            case .success(let json):
                do {
                    let jsons: [JSON] = try json.get(key: "stops")
                    let stops = jsons.compactMap { try? self.mapper.map(from: $0) }
                    completion(Result.success(stops))
                } catch {
                    completion(Result.failure(error))
                }
            }
        }
    }
}
