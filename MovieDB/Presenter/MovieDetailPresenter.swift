//
//  MovieDetailPresenter.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 8/4/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import RxSwift

class MovieDetailPresenter {
    private let interactor: MovieDetailInteractor
    
    init(with Dinteractor: MovieDetailInteractor) {
        self.interactor = Dinteractor
    }
    
    func getMovieDetail(with id:String) -> Observable<Movie> {
        return interactor.getMovieDetail(with: id)
    }
    
    func getMovieTrailer(with id:String) -> Observable<VideoList> {
        return interactor.getMovieTrailer(with: id)
    }
    
}
