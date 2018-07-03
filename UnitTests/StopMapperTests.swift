//
//  StopMapperTests.swift
//  KMKCore
//
//  Created by Michal Moskala on 03.07.2018.
//

import XCTest
@testable import KMKCore

class StopMapperTests: XCTestCase {

    var sut: StopMapper!
    
    override func setUp() {
        super.setUp()
        sut = StopMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_map() throws {
        let json = try JSONLoader.loadJSON(name: "stop")
        XCTAssertNoThrow(try sut.map(from: json))
    }
    
    func test_map_properties() throws {
        let json = try JSONLoader.loadJSON(name: "stop")
        let stop = try sut.map(from: json)
        XCTAssertEqual(stop.category, .tram)
        XCTAssertEqual(stop.id, "6350927454370005260")
        XCTAssertEqual(stop.latitude, 180302996)
        XCTAssertEqual(stop.longitude, 72258514)
        XCTAssertEqual(stop.name, "Mrozowa")
        XCTAssertEqual(stop.shortName, "460")
    }

}
