//
//  HTTPOperationError.swift
//  KMKCore
//
//  Created by Michal Moskala on 01.07.2018.
//

import Foundation

internal enum HTTPOperationError: Error {
    case general(Error)
    case invalidResponse
}
