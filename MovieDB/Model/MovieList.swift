//
//  MovieList.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieList: Mappable {
    
    var list: [Movie]?
    
    required init?(map: Map)
    {
        
    }
    init() {
        
    }
    
    func mapping(map: Map){
        list <- map["results"]
    }
}

