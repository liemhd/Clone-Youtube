//
//  RelatedTableViewCell.swift
//  TestApiYoutube
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import UIKit
import Kingfisher

class RelatedTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var imageViewThumb: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelChannel: UILabel!
    @IBOutlet weak var labelCountView: UILabel!
    
    //MARK: - View Lyfe Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Function
    func fillData(_ mediumThumb: MediumModel, _ snippet: SnippetModel) {
        
        labelTitle.text = snippet.title
        labelChannel.text = snippet.channelTitle
        
//        if let url = URL(string: mediumThumb.url!) {
//            do {
//                let data = try Data(contentsOf: url)
//                self.imageViewThumb.image = UIImage(data: data)
//            } catch let err {
//                print("Error: \(err.localizedDescription)")
//            }
//        }
        guard let str = mediumThumb.url else {
            return
        }
        let url = URL(string: str)
        imageViewThumb.kf.setImage(with: url)
    }
    
}
