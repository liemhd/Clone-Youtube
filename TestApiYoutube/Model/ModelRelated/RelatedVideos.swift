//
//  RelatedVideos.swift
//  TestApiYoutube
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class RelateVideos: CoreObject {
    
    var kind: String?
    var etag: String?
    var regionCode: String?
    var pageInfoObject = [PageInfoModel]()
    var itemObject = [ItemsModel]()
    
    init(dict: [String : Any]) {
        kind = dict["kind"] as? String
        etag = dict["etag"] as? String
        regionCode = dict["regionCode"] as? String
        if let pageInfoData = dict["pageInfo"] as? [String: Any],
            let itemData = dict["items"] as? [[String: Any]] {
            pageInfoObject.append(PageInfoModel(dict: pageInfoData))
            itemObject = itemData.map({ItemsModel(dict: $0)})
        }
        
    }
    
}
