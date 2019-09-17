//
//  TopicDetailsModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class TopicDetailsModel: CoreObject {
    
    var topicIds: [String]?
    var relevantTopicIds: [String]?
    var topicCategories: [String]?
    
    init(dict: [String : Any]) {
        topicIds = dict["topicIds"] as? [String]
        relevantTopicIds = dict["relevantTopicIds"] as? [String]
        topicCategories = dict["topicCategories"] as? [String]
    }
    
    
}
