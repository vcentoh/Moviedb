//
//  MovieDBListPresent.swift
//  MovieDB
//
//  Created by Vicent De Freitas on 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import RxSwift

class MovieDBListPresenter {
    
    private let interactor: MovieDBListInteractor
    private let router: MovieDBListRouter
    
    init(_ interactor: MovieDBListInteractor, router: MovieDBListRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func getMovies(with type: SearchType) -> Observable<MovieList> {
        return interactor.getMovies(with: type)
    }
    
    func getMovies(by query: String) -> Observable<MovieList> {
        return interactor.getMovies(with: .searcOnline(word: query))
    }
    func showMovieDetail(with movie:Movie?, navigation:UINavigationController)
    {
        router.showMovieDetail(with: movie, navigation: navigation)
    }
}
