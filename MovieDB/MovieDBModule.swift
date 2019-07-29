//
//  MovieDBModule.swift
//  MovieDB
//
//  Created by Vicent De Freitas on 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import UIKit

class MovieDBModule {
    
    private let navigation: UINavigationController
    private let presenter: MovieDBListPresenter
    private let interactor: MovieDBListInteractor
    private let router: MovieDBListRouter
    
    init(with navigation: UINavigationController) {
        self.navigation = navigation
        self.interactor = MovieDBListInteractor()
        self.router = MovieDBListRouter(with: navigation)
        self.presenter = MovieDBListPresenter(interactor, router: router)
    }
    
    func showInitalView() {
        router.showMovieList(presenter)
    }
}
