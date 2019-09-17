//
//  idModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class IdModel: CoreObject {
    
    var kind: String?
    var videoId: String
    
    init(dict: [String : Any]) {
        kind = dict["dict"] as? String
        videoId =  dict["videoId"] as? String
    }
    
}
