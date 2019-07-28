//
//  Movie.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 7/22/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation

final class Movie: Program {
    var id: int?
    var video: Bool?
    var title: String?
    var posterLink: String?
    var pg17: Bool?
    var summary: String?
    var genre: [Genre]?
    var averageScore: String?
    var popularity: Double?
    var originalT: String?
    var DateRelease: String?
    var tagline: String?
    
    init?(map: Map)
    {}
    
    func mapping (map: Map)
    {
        id <- map["id"]
        title <- map["video"]
        posterLink <- map["poster_path"]
        pg017 <- map["adult"]
        summary <- map ["overview"]
        DateRelease <- map["release_date"]
        genre <- map["genres"]
        averageScore <- map["vote_average"]
        originalTitle <- map["original_title"]
        popularity <- map["popularity"]
        tagline <- map["tagline"]
    }
    
}

struct Genre: Mappable {
    var id: int?
    var name: String?
    
    init?(map: Map){
        
    }
    mutating func mapping(map: Map){
        id <- map["id"]
        name <- map["name"]
    }
    
}
