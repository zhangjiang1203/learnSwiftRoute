//
//  ViewController.swift
//  010-SwiftPracticeDemo
//
//  Created by pg on 2017/7/5.
//  Copyright © 2017年 DZHFCompany. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

//    @IBOutlet weak var zjPlayerView: ZJAVPlayerView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let playerView = ZJAVPlayerView.init(frame: self.view.bounds)
        self.view.insertSubview(playerView, at: 0)
        
        registerBtn.layer.masksToBounds = true;
        registerBtn.layer.cornerRadius = 5
        
        loginBtn.layer.masksToBounds = true
        loginBtn.layer.cornerRadius = 5
        
    }

    

}

