//
//  PageInfo.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class PageInfoModel: CoreObject {
    
    var totalResults: Int?
    var resultsPerPage: Int?
    
    init(dict: [String : Any]) {
        totalResults = dict["totalResults"] as? Int
        resultsPerPage = dict["resultsPerPage"] as? Int
    }
}
