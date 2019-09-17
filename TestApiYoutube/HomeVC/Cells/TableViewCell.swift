//
//  TableViewCell.swift
//  TestApiYoutube
//
//  Created by Apple on 7/12/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MARK: - Properties
    @IBOutlet weak var imvThumb: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Function
    func fillData(medium: MediumModel, snippet: SnippetModel, statistics: StatisticsModel) {
        titleLabel.text = snippet.title
        infoLabel.text = "\(snippet.channelTitle ?? "")- \(statistics.viewCount ?? "") lượt xem"
        if let url = URL(string: medium.url!) {
            do {
                let data = try Data(contentsOf: url)
                self.imvThumb.image = UIImage(data: data)
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
    }
    
}
