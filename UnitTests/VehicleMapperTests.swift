//
//  VehicleMapperTests.swift
//  KMKCore
//
//  Created by Michal Moskala on 02.07.2018.
//

import XCTest
@testable import KMKCore

class VehicleMapperTests: XCTestCase {

    private var sut: VehicleMapper!
    
    override func setUp() {
        super.setUp()
        sut = VehicleMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_map() throws {
        let json = try JSONLoader.loadJSON(name: "vehicle")
        XCTAssertNoThrow(try sut.map(from: json))
    }

    func test_map_propertiesValue() throws {
        let json = try JSONLoader.loadJSON(name: "vehicle")
        let vehicle = try sut.map(from: json)
        XCTAssertEqual(vehicle.id, "6352185295672181148")
        XCTAssertEqual(vehicle.category, .tram)
        XCTAssertEqual(vehicle.name, "1 Wzgórza Krzesławickie")
        XCTAssertEqual(vehicle.longitude, 71691000)
        XCTAssertEqual(vehicle.latitude, 180190764)
        XCTAssertEqual(vehicle.heading, 315)
    }
}
