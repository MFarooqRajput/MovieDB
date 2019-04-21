//
//  ServicceResponse.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 21/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

typealias ValueErrorTuple<Value: Codable> = (value: Value?, error: String?)
typealias ServiceEvent<Value: Codable> = (ValueErrorTuple<Value>) -> Void
typealias SuccessCompletion<Value: Codable> = (Value) -> Void

struct ServiceResponse<Value: Codable>: Codable {
    let errorMessage: String?
    let hasError: Bool
    let hasResponse: Bool
    let responseObject: Value?
    
    enum CodingKeys: String, CodingKey {
        case errorMessage
        case hasError
        case hasResponse
        case responseObject
    }
}
