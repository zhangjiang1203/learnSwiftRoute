//
//  ViewController.swift
//  013-SwiftPracticeDemo
//
//  Created by pg on 2017/7/13.
//  Copyright © 2017年 DZHFCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ZJSegmentDelegate {

    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentView = ZJSegmentScrollView.init(frame: CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 40))
        segmentView.delegate = self
        segmentView.segmentTitleArr = ["推荐","社会热点","娱乐新闻","当地资讯","经典收藏","体育新闻","汽车之家","搞笑段子","科技频道"]
        segmentView.normalColor = UIColor.white
        segmentView.selectedColor = UIColor.init(red: 0, green: 0.78, blue: 0.4, alpha: 1)
        segmentView.lineWidth = 60
        self.view.addSubview(segmentView);
    }
    
    func  segmentClickAction(index:NSInteger) {
        infoLabel.text = "当前点击"+String(index)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

}

