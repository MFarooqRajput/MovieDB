//
//  MovieRepositroy.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 21/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

class MovieRepositroy {
    
    class func getMovieList(completion: @escaping ServiceEvent<MovieList>) {
        NetworkManager.makeCall(url: APIs.movieListUrl, isOffline: true, type: .get, completion: completion)
    }
    
    class func getMovieDetails(url: String, completion: @escaping ServiceEvent<MovieDetail>) {
        NetworkManager.makeCall(url: url, isOffline: true, type: .get, completion: completion)
    }
    
    class func getMovieVideo(url: String, completion: @escaping ServiceEvent<VideoList>) {
        NetworkManager.makeCall(url: url, isOffline: true, type: .get, completion: completion)
    }
}
