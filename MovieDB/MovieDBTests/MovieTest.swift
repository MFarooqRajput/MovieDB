//
//  MovieTest.swift
//  MovieDBTests
//
//  Created by Muhammad Farooq on 25/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import XCTest
@testable import MovieDB

class MovieTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetImageUrl() {
        let movie = Movie(id: 1, title: "test movie", poster_path: "/test_path")
        XCTAssertEqual(movie.getImageUrl(), "http://image.tmdb.org/t/p/w342/test_path")
    }
}
