//
//  Result.swift
//  KMKCore
//
//  Created by Michal Moskala on 02.07.2018.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
}
