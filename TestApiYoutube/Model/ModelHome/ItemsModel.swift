//
//  VideosModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class ItemsModel: CoreObject {
    
    var kind: String?
    var etag: String?
    var id: String?
    var snippetObject = [SnippetModel] ()
    var contentDetailsObject = [ContentDetailsModel]()
    var statusObject = [StatusModel]()
    var statisticsObject = [StatisticsModel]()
    var playerObject = [PlayerModel]()
    var topicDetailsObject = [TopicDetailsModel]()
    var liveStreamingDetailsObject = [LiveStreamingDetailsModel]()
    var localizationsObject = [LocalizationsModel]()
    
    
    init(dict: [String : Any]) {
        kind = dict["kind"] as? String
        etag = dict["etag"] as? String
        id = dict["id"] as? String
        if let snippetData = dict["snippet"] as? [String: Any],
        let contentDetailsData = dict["contentDetails"] as? [String: Any],
        let statusData = dict["status"] as? [String: Any],
        let statisticsData = dict["statistics"] as? [String: Any],
        let playerData = dict["player"] as? [String: Any],
        let topicDetailsData = dict["topicDetails"] as? [String: Any],
        let liveStreamingDetailsData = dict["liveStreamingDetails"] as? [String: Any],
        let localizationsData = dict["localizations"] as? [String: Any] {
            snippetObject.append(SnippetModel(dict: snippetData))
//            snippetObject = snippetData.map({SnippetModel(dict: $0)})
            contentDetailsObject.append(ContentDetailsModel(dict: contentDetailsData))
            statusObject.append(StatusModel(dict: statusData))
            statisticsObject.append(StatisticsModel(dict: statisticsData))
            playerObject.append(PlayerModel(dict: playerData))
            topicDetailsObject.append(TopicDetailsModel(dict: topicDetailsData))
            liveStreamingDetailsObject.append(LiveStreamingDetailsModel(dict: liveStreamingDetailsData))
            localizationsObject.append(LocalizationsModel(dict: localizationsData))
        
        }
    }
    
    
}
