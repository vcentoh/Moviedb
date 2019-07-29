//
//  TvShowList.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import ObjectMapper

class TvShowList: Mappable {
    
    var list: [TVShow]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map){
        list <- map["results"]
    }
}
