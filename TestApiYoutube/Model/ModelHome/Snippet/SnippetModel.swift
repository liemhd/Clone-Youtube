//
//  SnippetModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class SnippetModel: CoreObject {
    
    var publishedAt: String?
    var channelId: String?
    var title: String?
    var description: String?
    var thumbnailsObject = [ThumbnailsModel]()
    var channelTitle: String?
    var tags: [String]?
    var categoryId: String?
    var liveBroadcastContent: String?
    var defaultLanguage: String?
    var localizedObject = [LocalizedModel]()
    var defaultAudioLanguage: String?
    
    
    init(dict: [String : Any]) {
        publishedAt = dict["publishedAt"] as? String
        channelId = dict ["channelId"] as? String
        title = dict["title"] as? String
        description = dict ["description"] as? String
        if let thumbnailsData = dict["thumbnails"] as? [String: Any],
            let localizedData = dict["localized"] as? [String: Any] {
            thumbnailsObject.append(ThumbnailsModel(dict: thumbnailsData))
            localizedObject.append(LocalizedModel(dict: localizedData))
        }
        channelTitle = dict["channelTitle"] as? String
        tags = dict["tags"] as? [String]
        categoryId = dict["categoryId"] as? String
        liveBroadcastContent = dict["liveBroadcastContent"] as? String
        defaultLanguage = dict["defaultLanguage"] as? String
        defaultAudioLanguage = dict["defaultAudioLanguage"] as? String
        
    }
    
    
}
