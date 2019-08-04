//
//  MovieDBListCell.swift
//  MovieDB
//
//  Created by Vicent De Freitas on 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import UIKit



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
        DispatchQueue.global().async {
            guard let link = URL(string: urlPath + path),
                let data = try? Data(contentsOf: link) else {return}
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.movieImage.image = image
            }
            
        }
    }
}
