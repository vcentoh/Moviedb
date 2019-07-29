//
//  EntDBApi.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 7/22/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import Moya

var apiKey: String = "84af23760314dfede939aa567bbadb40"
var apiUrl: String = "https://api.themoviedb.org/3/"

enum EntDBApi {
    // T as Top, TR as TopRated, U as upcoming
    case getTMovies
    case getTRMovies
    case getUMovies
    case getMovie(query: String)
    case getMovieData(id : String )
    case getMovieTrailer(id : String)
}

extension EntDBApi : TargetType {

    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var baseURL : URL {
        guard let url  = URL( string : apiUrl )
            else    { fatalError("Url could not be Configured") }
    return url
    }
    
    var path: String {
        switch self {
        case .getTMovies:
            return "movie/popular"
        case .getTRMovies:
            return "movie/top_rated"
        case .getUMovies:
            return "movie/upcoming"
        case .getMovieData(let id):
            return "movie/" + id
        case .getMovieTrailer(let id):
            var trailerurl = "movie/" + id
            trailerurl += "/videos"
            return trailerurl
        case .getMovie:
            return "search/movie"
        }
    }
    
    var method: Moya.Method
    {
        switch self {
        default:
            return .get
        }
    }
    
//    var sData: Data
//    {
//        switch self {
//        case .getTMovies:
//            guard let link = Bundle.main.url (forResource: "Movies", withExtension: "json"),
//                let data = try? Data(contentsOf: link) else { return Data() }
//            return data
//        case .getTShow:
//            guard let link = Bundle.main.url(forResource: "Tv", withExtension: "json" ),
//            let data = try? Data(contentsOf: link) else { return Data() }
//            return data
//        case .getMovieData:
//            guard let link = Bundle.main.url (forResource: "Movies", withExtension: "json"),
//                let data = try? Data(contentsOf: link) else { return Data() }
//            return data
//        case .getShowData:
//            guard let link = Bundle.main.url (forResource: "Movies", withExtension: "json"),
//            let data = try? Data(contentsOf: link) else { return Data() }
//            return data
//
//        default: return Data()
//        }
//    }
    
    var task: Task {
        var  params: [String: String] = [:]
        switch self {
        case .getMovie(let searchobject):
            params ["api_key"] = apiKey
            params ["Language"] = "en-US"
            params ["query"] = searchobject
            params ["page"] = "1"
            params ["enclude_adult"] = "false"
            return .requestParameters (parameters: params, encoding: URLEncoding.queryString)
        case .getMovieData,
             .getMovieTrailer:
            params ["api_key"] = apiKey
            params ["Language"] = "en-US"
            return .requestParameters (parameters: params, encoding: URLEncoding.queryString)
        default:
            params ["api_key"] = apiKey
            params ["Language"] = "en-US"
            params ["page"] = "1"
            return .requestParameters (parameters: params, encoding: URLEncoding.queryString)        }
    }
}

