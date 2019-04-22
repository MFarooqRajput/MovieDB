//
//  MovieList.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 22/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

class MovieList: Codable {
    let list: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case list = "results"
    }
    
    init(list: [Movie], responseCode: ResponseCode) {
        self.list = list
    }
}
