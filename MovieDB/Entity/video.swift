//
//  video.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import ObjectMapper

let youtubelink = "https://www.youtube.com/watch?v="

struct VideoList: Mappable {
    var list:[Video]?
    init?(map:Map) {
        
    }
    
    mutating func mapping(map:Map) {
        list <- map["results"]
    }
}

struct Video: Mappable {
    
    var videoPath:String?
    var type:String?
    
    init?(map:Map) {
        
    }
    mutating func mapping(map: Map) {
        videoPath <- map["key"]
        type <- map["type"]
    }
}
