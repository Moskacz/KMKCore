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
    private let url: URL
    
    internal init(httpClient: HTTPClient, mapper: Mapper<JSON, Stop>, url: URL) {
        self.httpClient = httpClient
        self.mapper = mapper
        self.url = url
    }

    func getStops(parameters: GetStopsParameters, completion: @escaping ((Result<[Stop]>) -> Void)) {
        
    }
}
