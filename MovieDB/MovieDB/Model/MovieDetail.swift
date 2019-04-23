//
//  MovieDetail.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 22/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

class MovieDetail: Codable {
    
    let id: Int
    let title, poster_path, overview, release_date: String
    let genres: [Genre]
    
    init(id: Int, title: String, poster_path: String, overview: String, release_date: String, genres: [Genre]) {
        self.id = id
        self.title = title
        self.poster_path = poster_path
        self.overview = overview
        self.release_date = release_date
        self.genres = genres
    }
    
    func getLink() -> String {
        return Constants.movieImagesUrl + "\(self.poster_path)"
    }
    
    func getGenres() -> String {
        var genresArray: [String] = []
        for genre in genres {
            genresArray.append(genre.name)
        }
        return genresArray.joined(separator: ",")
    }
}
