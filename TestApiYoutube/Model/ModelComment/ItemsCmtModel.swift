//
//  ItemsCmtModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/26/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class ItemsCmtModel: CoreObject {
    
    var kind: String?
    var etag: String?
    var id: String?
    var snippet = [SnippetBiggestCmtModel] ()
    
    init(dict: [String : Any]) {
        kind = dict["kind"] as? String
        etag = dict["etag"] as? String
        id = dict["id"] as? String
        if let snippetData = dict["snippet"] as? [String: Any] {
            snippet.append(SnippetBiggestCmtModel(dict: snippetData))
        }
    }
}
