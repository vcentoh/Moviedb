//
//  TVShow.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import ObjectMapper

final class TVShow: Program, Mappable {
    var id: int?
    var video: Bool?
    var title: String?
    var posterLink: String?
    var pg17: Bool?
    var summary: String?
    var genre: [Genre]?
    var AverageScore: String?
    var popularity: Double?
    var originalTitle: String?
    var OriginCountry: [String]?
    var airDate: String?
    
    init(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        id <- map["id"]
        title <- map["name"]
        video <- map["video"]
        posterLink <- map["poset_path"]
        pg17 <- map["adult"]
        summary <- map["overview"]
        airDate <- map["First_air_date"]
        genre <- map["genres"]
        AverageScore <- map["vote_Average"]
        originalTitle <- map["original_name"]
        popularity <- map["popularity"]
        OriginCountry <- map["origin_country"]
        
    }
    
}
