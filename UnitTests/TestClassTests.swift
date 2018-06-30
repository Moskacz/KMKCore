//
//  TestClassTests.swift
//  KMKCore
//
//  Created by Michal Moskala on 30.06.2018.
//

import XCTest
@testable import KMKCore

class TestClassTests: XCTestCase {
    
    func test_testProperty() {
        XCTAssertEqual(TestClass().testProperty, 2)
    }
    
}
