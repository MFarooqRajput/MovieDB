//
//  Video.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 23/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

class Video: Codable {
    let id, iso_639_1, iso_3166_1, key, name, site, type: String
    let size: Int
    
    init(id: String, iso_639_1: String, iso_3166_1: String, key: String, name: String, site: String, size: Int, type: String) {
        self.id = id
        self.iso_639_1 = iso_639_1
        self.iso_3166_1 = iso_3166_1
        self.key = key
        self.name = name
        self.site = site
        self.size = size
        self.type = type
    }
}
