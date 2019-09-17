//
//  StatisticsModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class StatisticsModel: CoreObject {
    
    var viewCount: String?
    var likeCount: String?
    var dislikeCount: String?
    var favoriteCount: String?
    var commentCount: String?
    
    init(dict: [String : Any]) {
        viewCount = dict["viewCount"] as? String
        likeCount = dict["likeCount"] as? String
        dislikeCount = dict["dislikeCount"] as? String
        favoriteCount = dict["favoriteCount"] as? String
        commentCount = dict["commentCount"] as? String
    }
    
    
}
