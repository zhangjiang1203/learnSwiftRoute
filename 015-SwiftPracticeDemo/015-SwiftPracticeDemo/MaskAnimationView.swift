//
//  MaskAnimationView.swift
//  015-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/7/21.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class MaskAnimationView: UIView,CAAnimationDelegate {

    var backImageView:UIImageView!
    var maskLayer:CALayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setMyLayer(frame:frame)
    }
    
    func setMyLayer(frame:CGRect)  {
    
        backImageView = UIImageView.init(frame: frame)
        backImageView.image = UIImage.init(named: "findLocation")
        self.addSubview(backImageView)
        
        self.maskLayer = CALayer.init()
        self.maskLayer.contents = UIImage.init(named: "twitterLogoMask")?.cgImage
        self.maskLayer.contentsGravity = kCAGravityResizeAspect
        self.maskLayer.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 81)
        self.maskLayer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        self.maskLayer.position = CGPoint.init(x: frame.size.width/2, y: frame.size.height/2)
        self.backImageView.layer.mask = maskLayer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func animationMask() {
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.6
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        let initalBounds = NSValue.init(cgRect: maskLayer.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90, height: 73))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        self.maskLayer!.add(keyFrameAnimation, forKey: "bounds")
    }
    
     func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.backImageView.layer.mask = nil
    }

}
