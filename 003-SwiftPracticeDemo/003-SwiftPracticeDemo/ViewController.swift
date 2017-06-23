//
//  ViewController.swift
//  003-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/21.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var myTableView:UITableView!
    //数据资源可以自己添加
    var videoArr = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    
    ]
    
    var playVC = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView = UITableView.init(frame: self.view.bounds)
        myTableView.separatorStyle = .none
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.register(VideoCell.self, forCellReuseIdentifier: "videoCell");
        self.view .addSubview(myTableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = VideoCell.init(style: .default, reuseIdentifier: "videoCell")
        let video = videoArr[indexPath.row]
        
        cell.videoLabel.text = video.title;
        cell.shotImageView.image = UIImage.init(named:video.image)
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playerView = AVPlayer.init(url: NSURL.fileURL(withPath: path!))
        playVC.player = playerView
        self.present(playVC, animated: true) { 
            self.playVC.player?.play()//present过去之后就开始播放
        }
    }


}

