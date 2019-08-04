//
//  MovieDBListInteractor.swift
//  MovieDB
//
//  Created by Vicent De Freitas on 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper

class MovieDBListInteractor {
    
    private var provider = MoyaProvider<EntDBApi>()
    private var movies: PublishSubject<MovieList> = PublishSubject<MovieList>()
    
    func getMovies(with type: SearchType) -> Observable<MovieList> {
        switch type {
        case .popular:
            return provider.rx.request(EntDBApi.getTMovies)
                .asObservable()
                .mapObject(MovieList.self)
        case .topRated:
            return provider.rx.request(EntDBApi.getTRMovies)
                .asObservable()
                .mapObject(MovieList.self)
        case .upcoming:
            return provider.rx.request(EntDBApi.getUMovies)
                .asObservable()
                .mapObject(MovieList.self)
        case .searcOnline(let search):
            return provider.rx.request(EntDBApi.getMovie(query: search))
                .asObservable()
                .mapObject(MovieList.self)
        default:
            return Observable.just(MovieList())
        }
    }
    
}
