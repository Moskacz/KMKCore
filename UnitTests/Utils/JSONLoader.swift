//
//  File.swift
//  KMKCore
//
//  Created by Michal Moskala on 02.07.2018.
//

import Foundation
import XCTest
@testable import KMKCore

enum LoadJSONError: Error {
    case fileMissing
    case notJSON
}

class JSONLoader {
    static func loadJSON(name: String) throws -> JSON {
        let bundle = Bundle(for: self)
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            throw LoadJSONError.fileMissing
        }
        
        let data = try Data(contentsOf: url)
        let object = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        if let json = object as? JSON {
            return json
        } else {
            throw LoadJSONError.notJSON
        }
    }
}


