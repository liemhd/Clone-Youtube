//
//  HistorySearchTableViewCell.swift
//  TestApiYoutube
//
//  Created by Apple on 8/16/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import UIKit

class HistorySearchTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    @IBOutlet private weak var labelHistory: UILabel!
    
    //MARK: - View Lyfe Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //MARK: - Function
    func fillData(data: String) {
        labelHistory.text = data
    }
    
    //MARK: - Action
    @IBAction func buttonActionPush(_ sender: Any) {
        
    }
    
}
