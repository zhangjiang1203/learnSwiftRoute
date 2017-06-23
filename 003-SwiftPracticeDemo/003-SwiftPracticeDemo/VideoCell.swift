//
//  VideoCell.swift
//  003-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/21.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

struct video {
    let image :String
    let title :String
    let source :String
}


class VideoCell: UITableViewCell {
    
    var shotImageView:UIImageView!
    var playImageView:UIImageView!
    var videoLabel:UILabel!
    let ScreenW  = UIScreen.main.bounds.size.width
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func setUpUI() {
        //开始布局
        shotImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenW, height: 220))
        
        playImageView = UIImageView.init()
        playImageView.center = CGPoint.init(x: ScreenW/2, y: 110)
        playImageView.bounds = CGRect.init(x: 0, y: 0, width: 50, height: 50);
        playImageView.contentMode = .scaleAspectFit
        playImageView.image = UIImage.init(named:"playBtn")
        
        videoLabel = UILabel.init(frame: CGRect.init(x: 20, y: playImageView.frame.maxY+10, width: ScreenW-40, height: 20))
        videoLabel.textColor = UIColor.white
        videoLabel.textAlignment = .center
        
        self.contentView.addSubview(shotImageView)
        self.contentView.addSubview(playImageView)
        self.contentView.addSubview(videoLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
