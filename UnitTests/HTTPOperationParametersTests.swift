//
//  HTTPOperationParametersTests.swift
//  KMKCore
//
//  Created by Michal Moskala on 03.07.2018.
//

import XCTest
@testable import KMKCore

class HTTPOperationParametersTests: XCTestCase {

    func test_noQueryItems() {
        let sut = HTTPOperationParameters(url: "http://mywebsite.com/myservice", method: .GET)
        let request = sut.urlRequest!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(request.url!.absoluteString, "http://mywebsite.com/myservice")
    }

    func test_queryItems() {
        let queryItems = [URLQueryItem(name: "value1", value: "100"),
                          URLQueryItem(name: "value2", value: "test")]
        let sut = HTTPOperationParameters(url: "http://mywebsite.com/myservice", method: .GET, queryItems: queryItems)
        let request = sut.urlRequest!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(request.url!.absoluteString, "http://mywebsite.com/myservice?value1=100&value2=test")
    }
}
