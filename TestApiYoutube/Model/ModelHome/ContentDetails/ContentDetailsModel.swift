//
//  ContentDetails.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class ContentDetailsModel: CoreObject {
    
    var duration: String?
    var dimension: String?
    var definition: String?
    var caption: String?
    var licensedContent: Bool?
    var projection: String?
    
    init(dict: [String : Any]) {
        duration = dict["duration"] as? String
        dimension = dict["dimension"] as? String
        definition = dict["definition"] as? String
        caption = dict["caption"] as? String
        licensedContent = dict["licensedContent"] as? Bool
        projection = dict["projection"] as? String
    }
    
    
}
