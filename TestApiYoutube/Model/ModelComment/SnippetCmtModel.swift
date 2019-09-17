//
//  SnippetCmtModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/26/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class SnippetCmtModel: CoreObject {
    
    var authorDisplayName: String?
    var authorProfileImageUrl: String?
    var authorChannelUrl: String?
    var authorChannelId = [AuthorChannelIdModel] ()
    var videoId: String?
    var textDisplay: String?
    var textOriginal: String?
    var canRate: Bool?
    var viewerRating: String?
    var likeCount: Int?
    var publishedAt: String?
    var updatedAt: String?
    
    init(dict: [String : Any]) {
        authorDisplayName = dict["authorDisplayName"] as? String
        authorProfileImageUrl = dict["authorProfileImageUrl"] as? String
        authorChannelUrl = dict["authorChannelUrl"] as? String
        if let authorChannelIdData = dict["authorChannelId"] as? [String: Any] {
            authorChannelId.append(AuthorChannelIdModel(dict: authorChannelIdData))
        }
        videoId = dict["videoId"] as? String
        textDisplay = dict["textDisplay"] as? String
        textOriginal = dict["textOriginal"] as? String
        canRate = dict["canRate"] as? Bool
        viewerRating = dict["viewerRating"] as? String
        likeCount = dict["likeCount"] as? Int
        publishedAt = dict["publishedAt"] as? String
        updatedAt = dict["updatedAt"] as? String
    }
    
    
}
