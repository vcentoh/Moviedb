//
//  Show.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation

protocol Show {
    
    var id: Int? {get set}
    var video: Bool? {get set}
    var title: String? {get set}
    var posterLink: String? {get set}
    var pg17: Bool? {get set}
    var summary: String? {get set}
    var genre: [Genre]? {get set}
    var averageScore: String? {get set}
    var popularity: Double? {get set }
    var originalTitle: String? {get set}
}

public enum SearchType {
    case popular
    case upcoming
    case topRated
    case searcOnline(word: String)
    case getMovie
}
