//
//  thumbnailsModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class ThumbnailsModel: CoreObject {
    
    var defaultObject = [DefaultModel]()
    var mediumObject = [MediumModel]()
    var highObject = [HighModel]()
    var standardObject = [StandardModel]()
    var maxresObject = [MaxresModel]()
    
    init(dict: [String : Any]) {
        if let defaultData = dict["default"] as? [String: Any],
            let mediumData = dict["medium"] as? [String: Any],
            let hightData = dict["high"] as? [String: Any],
            let standardData = dict["standard"] as? [String: Any],
            let maxresData = dict["maxres"] as? [String: Any] {
            
            defaultObject.append(DefaultModel(dict: defaultData))
            mediumObject.append(MediumModel(dict: mediumData))
            highObject.append(HighModel(dict: hightData))
            standardObject.append(StandardModel(dict: standardData))
            maxresObject.append(MaxresModel(dict: maxresData))
            
            
        }
    }
    
    
}
