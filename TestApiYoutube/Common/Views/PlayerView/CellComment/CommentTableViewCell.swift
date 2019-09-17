//
//  CommentTableViewCell.swift
//  TestApiYoutube
//
//  Created by Apple on 7/26/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewAvt: UIImageView!
    @IBOutlet weak var labelChannelName: UILabel!
    @IBOutlet weak var labelComment: UILabel!
    @IBOutlet weak var labelCountLike: UILabel!
    
    private var timer: Timer?
    let now = Date()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.getRemainingTime()
        imageViewAvt.layer.cornerRadius = imageViewAvt.frame.size.width / 2
        imageViewAvt.clipsToBounds = true
    }
    
    func fillData(_ data: SnippetCmtModel) {
        let isoDate = data.publishedAt!
        
        let dateFormatter = ISO8601DateFormatter()
//        dateFormatter.dateFormat = "YYYY-MM-DDThh:mm:ss.sZ"
        let date = dateFormatter.date(from: isoDate)
        
//        print(isoDate)
        
        let formatter = DateInterval()
//        formatter.unitsStyle = .brief
//        formatter.allowedUnits = [ .month, .day, .hour, .minute, .second]
//        formatter.maximumUnitCount = 1
//        let stringDate = formatter.
        
        labelChannelName.text = "\(data.authorDisplayName ?? "")"
        labelComment.text = data.textOriginal
        labelCountLike.text = "\(data.likeCount ?? 0)"
        guard let str = data.authorProfileImageUrl else {
            return
        }
        let url = URL(string: str)
        imageViewAvt.kf.setImage(with: url)
        
    }
    
    private func getRemainingTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let startDate = "2018-06-02 10:11:12"
        let currentDate = dateFormatter.string(from: Date())
        
        if currentDate != startDate {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(calculateTime)), userInfo: nil, repeats: true)
            RunLoop.current.add(timer!, forMode: RunLoop.Mode.common)
            timer?.fire()
        }
        else {
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    
    @objc func calculateTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let stdate : String = "2018-06-02 10:11:12"
        let startDate = dateFormatter.date(from: stdate)!
        
        let currentDate = Date()
        
        let strTimer : String = startDate.offset(from: currentDate)
        if !strTimer.isEmpty {
            let stDay: String = "\((Int(strTimer)! % 31536000) / 86400)"
            let stHour: String = "\((Int(strTimer)! % 86400) / 3600)"
            let stMin: String = "\((Int(strTimer)! % 3600) / 60)"
            let stSec: String = "\(Int(strTimer)! % 60)"
//            labelChannelName.text = "Start In :\(stDay) Days \(stHour) Hours \(stMin) Minutes \(stSec) Seconds"
            print("Start In :\(stDay) Days \(stHour) Hours \(stMin) Minutes \(stSec) Seconds")

        }
        
    }
}
