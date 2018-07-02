//
//  VehiclesServiceWebImplTests.swift
//  KMKCore
//
//  Created by Michal Moskala on 02.07.2018.
//

import XCTest
@testable import KMKCore

class VehiclesServiceWebImplTests: XCTestCase {

    var sut: VehiclesServiceWebImpl!
    var httpClient: HTTPClientFake!
    var mapper: Mapper<JSON, Vehicle>!
    let url = URL(string: "http://someservices.com/service")!
    
    override func setUp() {
        super.setUp()
        httpClient = HTTPClientFake()
        mapper = VehicleMapper()
        sut = VehiclesServiceWebImpl(httpClient: httpClient,
                                     mapper: mapper,
                                     vehiclesURL: url)
    }
    
    override func tearDown() {
        sut = nil
        mapper = nil
        httpClient = nil
        super.tearDown()
    }

    func test_getVehicles_parameters() {
        sut.getVehicles(completion: { _ in })
        XCTAssertEqual(httpClient.passedParameters!.method, .GET)
        XCTAssertEqual(httpClient.passedParameters!.url, url)
    }
    
    func test_getVehicles_ifHttpClientHasThrowError_thenItShouldBeReturned() {
        let someError = NSError(domain: "", code: 0, userInfo: [:])
        let exp = expectation(description: "error_thrown")
        sut.getVehicles { (result) in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error as NSError, someError)
                exp.fulfill()
            default:
                XCTFail()
            }
        }
        
        httpClient.passedCompletionBlock?(Result.failure(someError))
        waitForExpectations(timeout: 0.1, handler: nil)
    }

    func test_getVehicles_ifHttpClientReturnsData_thenItShouldBeParsed() throws {
        let json = try JSONLoader.loadJSON(name: "vehicles")
        let exp = expectation(description: "data_retrieved")
        sut.getVehicles { (result) in
            switch result {
            case .success(let vehicles):
                XCTAssertTrue(vehicles.count > 0)
                exp.fulfill()
            default:
                XCTFail()
            }
        }
        
        httpClient.passedCompletionBlock?(Result.success(json))
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func test_getVehicles_ifHttpClientReturnsUnparsableData_thenErrorShouldBeReturned() {
        let json = Dictionary<String, Any>()
        let exp = expectation(description: "data_retrieved")
        sut.getVehicles { (result) in
            switch result {
            case .failure:
                exp.fulfill()
            default:
                XCTFail()
            }
        }
        
        httpClient.passedCompletionBlock?(Result.success(json))
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
}
