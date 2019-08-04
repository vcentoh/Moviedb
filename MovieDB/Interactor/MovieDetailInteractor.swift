//
//  MovieDetailInteractor.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 8/4/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import UIKit
import Moya
import Moya_ObjectMapper
import RxSwift

class MovieDetailInteractor {
    
    private let provider = MoyaProvider<EntDBApi>()
    
    func getMovieDetail(with id:String ) -> Observable<Movie>
    {
        return provider.rx.request(.getMovieData(id: id)).asObservable().mapObject(Movie.self)
        
    }
    func getMovieTrailer(with id:String) -> Observable<VideoList>
    {
        return provider.rx.request(.getMovieTrailer(id:id))
        .asObservable()
            .mapObject(VideoList.self)
    }
}
