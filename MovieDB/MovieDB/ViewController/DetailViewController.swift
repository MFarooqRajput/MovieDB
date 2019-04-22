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
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieTextView: UITextView!
    
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
        movieImageView.setImage(url: URL(string: movie.getLink()))
        movieTitleLabel.text = movie.title
        
        let regularAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        let boldAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]

        let genresString = NSMutableAttributedString(string: "Genres ", attributes: boldAttributes)
        let dateString = NSMutableAttributedString(string: "Date ", attributes: boldAttributes)
        let overviewString = NSMutableAttributedString(string: "Overview ", attributes: boldAttributes)
        
        let sectionText = NSMutableAttributedString(string: " ")
        sectionText.append(genresString)
        sectionText.append(dateString)
        sectionText.append(overviewString)
        
        movieTextView.attributedText = sectionText
    }
    
    @IBAction func watchTrailer(_ sender: Any) {
    }
}
