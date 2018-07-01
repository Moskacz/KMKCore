//
//  JSONTests.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import XCTest
@testable import KMKCore

class JSONTests: XCTestCase {
    
    func test_ifValueForKeyDoesntExist_thenErrorShouldBeThrown() throws {
        let json: Dictionary<String, Any> = ["mykey": 3]
        XCTAssertThrowsError(try json.get(key: "invalidkey") as Int, "") { (error) in
            XCTAssertEqual(error as! MappingError, MappingError.valueMissing(key: "invalidkey"))
        }
    }
    
    func test_ifValueIsNotMappable_thenErrorShouldBeThrows() throws {
        let json: Dictionary<String, Any> = ["mykey": 3]
        XCTAssertThrowsError(try json.get(key: "mykey") as String, "") { (error) in
            XCTAssertEqual(error as! MappingError, MappingError.couldNotMap(key: "mykey"))
        }
    }
    
    func test_get() throws {
        let json: Dictionary<String, Any> = ["mykey": 3]
        XCTAssertNoThrow(try json.get(key: "mykey") as Int)
    }
    
}
