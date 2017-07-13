//
//  ViewController.swift
//  013-SwiftPracticeDemo
//
//  Created by pg on 2017/7/13.
//  Copyright © 2017年 DZHFCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let segmentView = ZJSegmentScrollView.init(frame: CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 40))
        segmentView.segmentTitleArr = ["第一","第二","第三","第四"]
//        segmentView.normalColor = UIColor.yellow
//        segmentView.selectedColor = UIColor.purple
        self.view.addSubview(segmentView);
    }

}

