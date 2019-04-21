//
//  ResponseCode.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 21/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

class ResponseCode: Codable {
    let httpStatus, statusCode, code: Int
    
    init(httpStatus: Int, statusCode: Int, code: Int) {
        self.httpStatus = httpStatus
        self.statusCode = statusCode
        self.code = code
    }
}
