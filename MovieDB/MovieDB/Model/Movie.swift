//
//  Movie.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 21/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

class Movie: Codable {
    let id: Int
    let title, poster_path: String
    
    init(id: Int, title: String, poster_path: String) {
        self.id = id
        self.title = title
        self.poster_path = poster_path
    }
    
    func getLink() -> String {
        return Constants.movieImagesUrl + "\(self.poster_path)"
    }
}
