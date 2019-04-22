//
//  DetailViewController.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 21/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: Movie!
    
    var movieDetail: MovieDetail! {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        loadData()
    }
    
    func loadData() {
        MovieRepositroy.getMovieDetails(url: String(movie.id)) { [weak self] response in
            self?.handleErrors(response: response) { data in
                self?.movieDetail = data
            }
        }
    }
    
    func updateView() {
    }
}
