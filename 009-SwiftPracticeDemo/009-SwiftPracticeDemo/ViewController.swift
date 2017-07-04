//
//  ViewController.swift
//  009-SwiftPracticeDemo
//
//  Created by pg on 2017/7/4.
//  Copyright © 2017年 DZHFCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    fileprivate var imageScrollView:UIScrollView!
    fileprivate var scaleImage:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageScrollView = UIScrollView.init(frame: self.view.bounds)
        imageScrollView.showsVerticalScrollIndicator = false
        imageScrollView.showsHorizontalScrollIndicator = false
        imageScrollView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        imageScrollView.maximumZoomScale = 3
        imageScrollView.delegate = self
        imageScrollView.minimumZoomScale = 0.2
        self.view.addSubview(imageScrollView)
        
        scaleImage = UIImageView.init(frame: self.view.bounds)
        scaleImage.contentMode = .scaleAspectFit;
        scaleImage.image = UIImage.init(named: "myScaleImage.jpg")
        scaleImage.isUserInteractionEnabled = true
        imageScrollView.addSubview(scaleImage)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scaleImage
    }
    
    //scrollView的代理方法
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = scaleImage.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 :0
        print("输出的放大值===%f===%f",horizontalSpace,verticalSpace)
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
    }
}
