//
//  YoutubeReponse.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

protocol CoreObject: class {
    
    init(dict: [String: Any])
}

final class YoutubeReponse: CoreObject {

    var kind: String?
    var etag: String?
    var nextPageToken: String?
    var pageInfoObject = [PageInfoModel]()
    var itemObject = [ItemsModel]()
    
    init(dict: [String : Any]) {
        kind = dict["kind"] as? String
        etag = dict["etag"] as? String
        nextPageToken = dict["nextPageToken"] as? String
        if let pageInfoData = dict["pageInfo"] as? [String: Any],
            let itemData = dict["items"] as? [[String: Any]] {
            pageInfoObject.append(PageInfoModel(dict: pageInfoData))
            itemObject = itemData.map({ItemsModel(dict: $0)})
        }
        
    }
    
}
