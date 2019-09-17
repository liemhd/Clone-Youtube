//
//  CountCmtTableViewCell.swift
//  TestApiYoutube
//
//  Created by Apple on 8/1/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import UIKit

class CountCmtTableViewCell: UITableViewCell {
    @IBOutlet weak var labelCountCmt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData(countCmt: StatisticsModel) {
        labelCountCmt.text = countCmt.commentCount
    }
    
}
