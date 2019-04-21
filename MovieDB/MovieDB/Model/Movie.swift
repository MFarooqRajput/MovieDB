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
        return "http://image.tmdb.org/t/p/w342\(self.poster_path)"
    }
}


//http://image.tmdb.org/t/p/w342/rqAHkvXldb9tHlnbQDwOzRi0yVD.jpg

/*
"vote_count":186,
"id":456740,
"video":false,
"vote_average":5.2,
"title":"Hellboy",
"popularity":414.203,
"poster_path":"\/nUXCJMnAiwCpNPZuJH2n6h5hGtF.jpg",
"original_language":"en",
"original_title":"Hellboy",
"genre_ids":[
28,
12,
14
],
"backdrop_path":"\/5BkSkNtfrnTuKOtTaZhl8avn4wU.jpg",
"adult":false,
"overview":"Hellboy comes to England, where he must defeat Nimue, Merlin's consort and the Blood Queen. But their battle will bring about the end of the world, a fate he desperately tries to turn away.",
"release_date":"2019-04-10"
},
*/
