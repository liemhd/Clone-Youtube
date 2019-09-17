//
//  Player.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class PlayerModel: CoreObject {
    
    var embedHtml: String?
    
    init(dict: [String : Any]) {
        embedHtml = dict["embedHtml"] as? String
    }
    
    
}
