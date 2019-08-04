//
//  MovieDetailRouter.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 8/4/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailRouter {
    
    var presenter: MovieDetailPresenter?
    
    func showMovieDetail(with movie: Movie, navigation: UINavigationController) {
        guard let presenter = self.presenter else {return }
        let vc = MovieDetailVC(with: presenter, movie: movie)
        navigation.pushViewController(vc, animated: true)
        
    }
}
