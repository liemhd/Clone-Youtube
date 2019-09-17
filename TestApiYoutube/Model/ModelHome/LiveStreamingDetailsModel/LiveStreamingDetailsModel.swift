//
//  LiveStreamingDetailsModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class LiveStreamingDetailsModel: CoreObject {
    
    var actualStartTime: String?
    var actualEndTime: String?
    var scheduledStartTime: String?
    
    init(dict: [String : Any]) {
        actualStartTime = dict["actualStartTime"] as? String
        actualEndTime = dict["actualEndTime"] as? String
        scheduledStartTime = dict["scheduledStartTime"] as? String
    }
    
    
}
