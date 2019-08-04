//
//  MovieDetailModule.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 8/4/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailModule{

    private let router: MovieDetailRouter
    private let interactor: MovieDetailInteractor
    private let presenter: MovieDetailPresenter
    
    init(){
        router = MovieDetailRouter()
        interactor = MovieDetailInteractor()
        presenter = MovieDetailPresenter(with: interactor)
        router.presenter = presenter
    }
    
    func showMovieDetail(with movie:Movie, navigation: UINavigationController){
     router.showMovieDetail(with: movie, navigation: navigation)
    }
}
