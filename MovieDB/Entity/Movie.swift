//
//  Movie.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 7/22/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import ObjectMapper

final class Movie: Show, Mappable {
    
    var id: Int?
    var video: Bool?
    var title: String?
    var posterLink: String?
    var pg17: Bool?
    var summary: String?
    var genre: [Genre]?
    var averageScore: String?
    var popularity: Double?
    var originalTitle: String?
    var dateRelease: String?
    var tagline: String?
    
    init() {}
    
    init?(map: Map) {}
    
    func mapping (map: Map) {
        print(map)
        id <- map["id"]
        title <- map["title"]
        posterLink <- map["poster_path"]
        pg17 <- map["adult"]
        summary <- map ["overview"]
        dateRelease <- map["release_date"]
        genre <- map["genres"]
        averageScore <- map["vote_average"]
        originalTitle <- map["original_title"]
        popularity <- map["popularity"]
        tagline <- map["tagline"]
    }
}

struct Genre: Mappable {
    
    var id: Int?
    var name: String?
    
    init?(map: Map){
        
    }
    mutating func mapping(map: Map){
        id <- map["id"]
        name <- map["name"]
    }
}
