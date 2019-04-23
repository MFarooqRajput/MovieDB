//
//  DetailViewController.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 21/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import UIKit
import AVKit
import XCDYouTubeKit

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
    
    var videos: VideoList? {
        didSet {
            playVideo(videoIdentifier: videos?.list.first?.key)
        }
    }
    
    let playerViewController = AVPlayerViewController()
    
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
        movieImageView.setImage(url: URL(string: movie.getImageUrl()))
        movieTitleLabel.text = movie.title
        
        let regularAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        let boldAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]

        let genresString = NSMutableAttributedString(string: "Genres\n", attributes: boldAttributes)
        let dateString = NSMutableAttributedString(string: "\n\nDate\n", attributes: boldAttributes)
        let overviewString = NSMutableAttributedString(string: "\n\nOverview\n", attributes: boldAttributes)
        
        let genres = NSMutableAttributedString(string: movieDetail.getGenres(), attributes: regularAttributes)
        let date = NSMutableAttributedString(string: movieDetail.release_date, attributes: regularAttributes)
        let overview = NSMutableAttributedString(string: movieDetail.overview, attributes: regularAttributes)
        
        let sectionText = NSMutableAttributedString(string: "\n")
        sectionText.append(genresString)
        sectionText.append(genres)
        sectionText.append(dateString)
        sectionText.append(date)
        sectionText.append(overviewString)
        sectionText.append(overview)
        
        movieTextView.attributedText = sectionText
    }
    
    @IBAction func watchTrailer(_ sender: Any) {
        let urlString = String(movie.id) + "/videos"
        MovieRepositroy.getMovieVideo(url: urlString) { [weak self] response in
            self?.handleErrors(response: response) { data in
                self?.videos = data
            }
        }
    }
    
    func playVideo(videoIdentifier: String?) {
        //let playerViewController = AVPlayerViewController()
        self.present(playerViewController, animated: true, completion: nil)
        
        XCDYouTubeClient.default().getVideoWithIdentifier(videoIdentifier) { [weak playerViewController] (video: XCDYouTubeVideo?, error: Error?) in
            if let streamURLs = video?.streamURLs, let streamURL = (streamURLs[XCDYouTubeVideoQualityHTTPLiveStreaming] ?? streamURLs[YouTubeVideoQuality.hd720] ?? streamURLs[YouTubeVideoQuality.medium360] ?? streamURLs[YouTubeVideoQuality.small240]) {
                playerViewController?.player = AVPlayer(url: streamURL)
                
                NotificationCenter.default.addObserver(self, selector: #selector(self.playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
                
                playerViewController?.player?.play()
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func playerItemDidReachEnd(notification: NSNotification) {
        NotificationCenter.default.removeObserver(self)
        playerViewController.dismiss(animated: true, completion: nil)
    }
}
