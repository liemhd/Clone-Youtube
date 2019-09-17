//
//  CommentModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/26/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class CommentModel: CoreObject {
    
    var kind: String?
    var etag: String?
    var pageInfo = [PageInfoCmtModel] ()
    var nextPageToken: String?
    var items = [ItemsCmtModel] ()
    
    init(dict: [String : Any]) {
        kind = dict["kind"] as? String
        etag = dict["etag"] as? String
        nextPageToken = dict["nextPageToken"] as? String
        if let pageInfoData = dict["pageInfo"] as? [String: Any] {
            pageInfo.append(PageInfoCmtModel(dict: pageInfoData))
        }
        if let itemsData = dict["items"] as? [[String: Any]] {
            items = itemsData.map({ItemsCmtModel(dict: $0)})
        }
    }
}
