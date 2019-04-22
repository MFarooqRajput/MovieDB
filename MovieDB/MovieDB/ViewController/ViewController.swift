//
//  ViewController.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 21/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    
    var movies: MovieList? {
        didSet {
            updateView()
        }
    }
    var selectedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }

    func setupView() {
        configTabeleView()
        loadData()
    }
    
    func configTabeleView() {
        movieTableView.dataSource = self
        movieTableView.delegate = self
        movieTableView.tableFooterView = UIView(frame: .zero)
    }
    
    func loadData() {
        MovieRepositroy.getMovieList { [weak self] response in
            self?.handleErrors(response: response) { data in
                self?.movies = data
            }
        }
    }
    
    func updateView() {
        movieTableView.reloadData()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let vc = segue.destination as? DetailViewController {
                vc.movie = selectedMovie
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movies = movies, let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let movie = movies.list[indexPath.row]
        cell.configure(data: movie)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none;
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movies = movies else {
            return
        }
        selectedMovie = movies.list[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
}


