//
//  VideoList.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 23/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

class VideoList: Codable {
    let list: [Video]
    
    enum CodingKeys: String, CodingKey {
        case list = "results"
    }
    
    init(list: [Video], responseCode: ResponseCode) {
        self.list = list
    }
}
