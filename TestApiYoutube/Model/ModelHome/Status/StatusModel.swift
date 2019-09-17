//
//  StatusModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class StatusModel: CoreObject {
    
    var uploadStatus: String?
    var privacyStatus: String?
    var license: String?
    var embeddable: Bool?
    var publicStatsViewable: Bool?
    
    init(dict: [String : Any]) {
        uploadStatus = dict["uploadStatus"] as? String
        privacyStatus = dict["privacyStatus"] as? String
        license = dict["license"] as? String
        embeddable = dict["embeddable"] as? Bool
        publicStatsViewable = dict["publicStatsViewable"] as? Bool
    }
    
    
}
