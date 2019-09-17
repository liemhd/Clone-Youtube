//
//  AuthorChannelIdModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/26/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class AuthorChannelIdModel: CoreObject {
    
    var value: String?
    
    init(dict: [String : Any]) {
        value = dict["value"] as? String
    }
}
