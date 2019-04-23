//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 21/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: Movie) {
        movieTitleLabel.text = data.title
        movieImageView.setImage(url: URL(string: data.getImageUrl()))
    }
}
