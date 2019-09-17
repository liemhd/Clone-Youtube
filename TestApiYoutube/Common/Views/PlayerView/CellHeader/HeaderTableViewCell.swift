//
//  HeaderTableViewCell.swift
//  TestApiYoutube
//
//  Created by Apple on 8/1/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var labelTag: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCountView: UILabel!
    @IBOutlet weak var imvOpenDescription: UIImageView!
    @IBOutlet weak var labelLike: UILabel!
    @IBOutlet weak var labelDislike: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imvAvtChannel: UIImageView!
    @IBOutlet weak var labelNameChannel: UILabel!
    @IBOutlet weak var viewDescription: UIView!
    @IBOutlet weak var heightDescription: NSLayoutConstraint!
    
    var snippetHeader: SnippetModel!
    var statisticHeader: StatisticsModel!
    
    var showDescriptionClosue: (() -> Void)?
    
    //MARK: - View Lyfe Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        imvAvtChannel.layer.cornerRadius = imvAvtChannel.frame.size.width / 2
    }
    
    //MARK: - Function
    func fillData(_ statistic: StatisticsModel, _ snippet: SnippetModel, _ thumb: MediumModel) {
        snippetHeader = snippet
        statisticHeader =  statistic
        
        labelTitle.text = snippet.title
        labelCountView.text = "\(statistic.viewCount?.toDouble()?.kmFormatted ?? "") view"
        labelLike.text = statistic.likeCount?.toDouble()?.kmFormatted
        labelDislike.text = statistic.dislikeCount?.toDouble()?.kmFormatted
//        labelDescription.text = "\(snippet.publishedAt ?? "")\n \n\(snippet.description ?? "")"
        labelNameChannel.text = snippet.channelTitle
        
        guard let str = thumb.url else {return}
        let url = URL(string: str)
        imvAvtChannel.kf.setImage(with: url)
    }
    
    //MARK: - Action
    @IBAction func btnActionShowDescription(_ sender: Any) {
        
        if labelDescription.isHidden == true {
            imvOpenDescription.image = UIImage(named: "triangular-1")
            labelDescription.isHidden = false
            labelDescription.text = "Xuất bản \(snippetHeader.publishedAt ?? "")        \(snippetHeader.description ?? "")"
            labelCountView.text = "\(statisticHeader.viewCount ?? "") lượt xem"
            labelTitle.lineBreakMode = .byWordWrapping
            labelTitle.numberOfLines = 0
            showDescriptionClosue?()
        } else {
            labelDescription.frame.size.height = 0
            viewDescription.frame.size.height = 0
            imvOpenDescription.image = UIImage(named: "triangular")
            labelDescription.text = nil
            labelDescription.isHidden = true
            labelTitle.lineBreakMode = .byTruncatingTail
            labelTitle.numberOfLines = 2
            labelCountView.text = "\(statisticHeader.viewCount?.toDouble()?.kmFormatted ?? "") lượt xem"
            showDescriptionClosue?()
        }
        
    }
}

