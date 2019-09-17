//
//  ItemModelRelated.swift
//  TestApiYoutube
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class ItemModelRelated: CoreObject {
    
    var kind: String?
    var etag: String?
    var idObject = [IdModel] ()
    var snippetObject = [SnippetModel] ()
    
    init(dict: [String : Any]) {
        kind = dict["kind"] as? String
        etag = dict["etag"] as? String
        if let idData = dict["id"] as? [String: Any],
            let snippetData = dict["snippet"] as? [String: Any] {
            idObject.append(IdModel(dict: idData))
            snippetObject.append(SnippetModel(dict: snippetData))
        }
    }
    
}
