//
//  JaLocalizationsModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class JaLocalizationsModel: CoreObject {
    
    var title: String?
    var description: String?
    
    init(dict: [String : Any]) {
        title = dict["title"] as? String
        description = dict["description"] as? String
    }
    
}
