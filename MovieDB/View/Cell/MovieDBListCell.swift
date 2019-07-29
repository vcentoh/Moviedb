//
//  MovieDBListCell.swift
//  MovieDB
//
//  Created by Vicent De Freitas on 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

let urlPath = "https://image.tmdb.org/t/p/w500"

class MovieDBListCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    var movie: Movie?
    
    func setCell(with movie: Movie) {
        movieTitle.numberOfLines = 3
        movieTitle.text = movie.originalTitle
        self.movie = movie
        guard let imagePath = movie.posterLink else {return}
        setImage(path: imagePath)
    }
    
    private func setImage(path: String) {
        movieImage.contentMode = .scaleAspectFit
        movieImage.kf.indicatorType = .activity
        let link = URL(string: urlPath+path)
        let placeholderImage = UIImage(named: "filmplaceholder")
        movieImage.kf.setImage(with: link,
                               placeholder: placeholderImage,
                               options: [.transition(.fade(0.2))],
                               progressBlock: nil,
                               completionHandler: nil)
    }
}
