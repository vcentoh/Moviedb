//
//  EntDBApi.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 7/22/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import Moya

var apiKey: String = ""
var apiUrl: String = ""

enum EntDBApi {
    // T as Top, TR as TopRated, U as upcoming
    case getTMovies
    case getTRMovies
    case getUMovies
    case getTShow
    case getTRShow
    case getMovie (query : String)
    case getShow (query : String)
    case getMovieData (id : String )
    case getShowData (id: String)
    case getMovieTrailer ( id : String)
    case getShowTrailer (id : String)
    
}

extension EntDBApi : TargetType {
    
    var baseUrl : URL {
        guard let url  = URL( string : apiUrl )
            else    { fatalError("Url could not be Configured") }
    return url
    }
    
    var path: String {
        switch self {
        case .getTMovies:
            return "movies/popular"
        case .getTRMovies:
            return "movies/top_rated"
        case .getUMovies:
            return "movies/upcoming"
        case .getTShow:
            return "tv/popular"
        case .getTRShow:
            return "tv/top_rated"
        case .getMovie:
            return "search/movie"
        case .getShow:
            return "search/tv"
        case .getMovieData(let id):
            return "movie/" + id
        case .getShowData(let id):
            return "tv/" + id
        case .getMovieTrailer(let id):
            var trailerurl = "movie/" + id
            trailerurl += "/videos"
            return trailerurl
        case .getShowTrailer(let id):
            var trailerurl = "tv/" + id
            trailerurl += "/videos"
            return trailerurl
        }
    }
    
    var method: Moya.Method
    {
        switch self {
        default:
            return .get
        }
    }
    
    var sData: Data
    {
        switch self {
        case .getTMovies:
            guard let link = Bundle.main.url (forResource: "Movies", withExtension: "json"),
                let data = try? Data(contentsOf: link) else { return Data() }
            return data
        case .getTShow:
            guard let url = Bundle.main.url(forResource: "Tv", withExtension: "json" ),
            let data = try? Data(contentsOf: link) else { return Data() }
            return data
        case .getMovieData:
            guard let link = Bundle.main.url (forResource: "Movies", withExtension: "json"),
                let data = try? Data(contentsOf: link) else { return Data() }
            return data
        case .getShowData:
            guard let link = Bundle.main.url (forResource: "Movies", withExtension: "json"),
            let data = try? Data(contentsOf: link) else { return Data() }
            return data
            
        default: return Data()
        }
    }
    
    var task: Task {
        var  params: [String: String] = [:]
        switch self {
        case .getMovie(let searchobject):
            params ["api_key"] = apiKey
            params ["Language"] = "en-US"
            params ["query"] = searchobject
            params ["page"] = "1"
            params ["enclude_adult"] = "false"
            return .rquestParameters (parameters: params, enconding: URLEncoding.queryString)
        case .getShow(let searchobject):
            params ["api_key"] = apiKey
            params ["Language"] = "en-US"
            params ["query"] = searchobject
            params ["page"] = "1"
            return .rquestParameters (parameters: params, enconding: URLEncoding.queryString)
        case .getMovieData, .getShowData, .getMovieTrailer, .getShowTrailer:
            params ["api_key"] = apiKey
            params ["Language"] = "en-US"
            return .rquestParameters (parameters: params, enconding: URLEncoding.queryString)
        default:
            params ["api_key"] = apiKey
            params ["Language"] = "en-US"
            params ["page"] = "1"
            return .rquestParameters (parameters: params, enconding: URLEncoding.queryString)        }
    }
}

