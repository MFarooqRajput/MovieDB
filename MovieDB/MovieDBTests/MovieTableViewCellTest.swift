//
//  MovieTableViewCellTest.swift
//  MovieDBTests
//
//  Created by Muhammad Farooq on 25/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import XCTest
@testable import MovieDB

class MovieTableViewCellTest: XCTestCase {

    var controller : ViewController?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        _ = self.controller?.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCustomCell() {
        let movie = Movie(id: 1, title: "test movie", poster_path: "test poster path")
        let customCell = self.controller?.movieTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell
        XCTAssertNotNil(customCell, "No Custom Cell Available")
        customCell?.configure(data: movie)
       XCTAssertEqual(customCell?.movieTitleLabel.text, "test movie")
    }
}
