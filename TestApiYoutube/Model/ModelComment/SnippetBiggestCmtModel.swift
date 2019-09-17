//
//  SnippetBiggestCmtModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/26/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class SnippetBiggestCmtModel: CoreObject {
    
    var videoId: String?
    var topLevelComment = [TopLevelCmtModel] ()
    var canReply: Bool?
    var totalReplyCount: Int?
    var isPublic: Bool?
    
    init(dict: [String : Any]) {
        videoId = dict["videoId"] as? String
        if let topLevelCommentData = dict["topLevelComment"] as? [String: Any] {
            topLevelComment.append(TopLevelCmtModel(dict: topLevelCommentData))
        }
        canReply = dict["canReply"] as? Bool
        totalReplyCount = dict["totalReplyCount"] as? Int
        isPublic = dict["isPublic"] as? Bool
    }
    
}
