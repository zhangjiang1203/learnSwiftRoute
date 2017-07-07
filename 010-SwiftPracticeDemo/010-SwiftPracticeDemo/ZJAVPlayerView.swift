//
//  ZJAVPlayerView.swift
//  010-SwiftPracticeDemo
//
//  Created by pg on 2017/7/7.
//  Copyright © 2017年 DZHFCompany. All rights reserved.
//

import UIKit
import AVFoundation

class ZJAVPlayerView: UIView {
    
    var playItem:AVPlayerItem!
    var avPlayer:AVPlayer!
    var avPlayerLayer:AVPlayerLayer!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        initMyPlayerURL()
    }
    //在Main.StoryBoard中直接添加视图时调用
    override func awakeFromNib() {
        initMyPlayerURL()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //初始化播放对象
    func initMyPlayerURL() {
        let path = Bundle.main.path(forResource: "face together", ofType: "mp4")
        self.playItem = AVPlayerItem.init(url: NSURL.fileURL(withPath: path!))
        self.avPlayer = AVPlayer.init(playerItem: self.playItem);
        self.avPlayerLayer = AVPlayerLayer.init(player: self.avPlayer);
        self.avPlayerLayer.frame = frame
        self.avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.avPlayerLayer.contentsScale = UIScreen.main.scale
        self.avPlayer.play()
        self.layer.insertSublayer(self.avPlayerLayer, at: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loopVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.avPlayer.currentItem)
    }
    
    func loopVideo() {
        self.avPlayer.seek(to: CMTimeMake(0, 1))
        self.avPlayer.play()
    }
    
    
}
