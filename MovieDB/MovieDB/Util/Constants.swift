//
//  Constants.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 22/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

struct Constants {
    
    static let displayName = Bundle.main.displayName ?? "MovieDB"
    static let API_KEY = "fce0e28ab0cacfd2f85e32670ad51b11"
    static let movieImagesUrl = "http://image.tmdb.org/t/p/w342"
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    var displayName: String? {
        return infoDictionary?["CFBundleDisplayName"] as? String
    }
}
