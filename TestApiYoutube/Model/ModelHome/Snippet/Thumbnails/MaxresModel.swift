//
//  MaxresModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class MaxresModel: CoreObject {
    
    var url: String?
    var width: Int?
    var height: Int?
    
    init(dict: [String : Any]) {
        url = dict["url"] as? String
        width = dict["width"] as? Int
        height = dict["height"] as? Int
    }
    
    
}
