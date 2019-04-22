//
//  UIImageViewExtension.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 22/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func setImage(url: URL?) {
        sd_setShowActivityIndicatorView(true)
        sd_setIndicatorStyle(.gray)
        sd_setImage(with: url)
    }
}
