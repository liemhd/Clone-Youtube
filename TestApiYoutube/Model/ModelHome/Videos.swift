//
//  Videos.swift
//  TestApiYoutube
//
//  Created by Apple on 7/12/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

protocol CoreObject: class {
    
    init(dict: [String: Any])
}

class Videos{
    
    var kind: String?
    var etag: String?
    var nextPageToken: String?
    
}



