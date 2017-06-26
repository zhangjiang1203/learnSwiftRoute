//
//  ViewController.swift
//  004-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/21.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var screenW = UIScreen.main.bounds.size.width
    var screenH = UIScreen.main.bounds.size.height
    var showCamera = MySecondViewController.init()

    override var prefersStatusBarHidden: Bool{
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化scrollView
        scrollView = UIScrollView.init(frame: self.view.bounds)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize.init(width: CGFloat(6)*screenW, height:  screenH)
        scrollView.isPagingEnabled = true
        self.view.addSubview(scrollView)
        
        for i in 1...5 {
            let ImageView = UIImageView.init(frame: CGRect.init(x: CGFloat(i-1)*screenW, y: 0, width: screenW, height: screenH))
            ImageView.image = UIImage.init(named: String(format:"iphone6s_00%d.jpg",i))
            scrollView.addSubview(ImageView)
        }
        showCamera.view.frame = CGRect.init(x: CGFloat(5)*screenW, y: 0, width: screenW, height: screenH);
        //添加最后一个视图
        scrollView.addSubview(showCamera.view)
    }
}

