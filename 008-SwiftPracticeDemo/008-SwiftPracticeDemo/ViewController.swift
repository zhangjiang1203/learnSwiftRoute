//
//  ViewController.swift
//  008-SwiftPracticeDemo
//
//  Created by pg on 2017/7/3.
//  Copyright © 2017年 DZHFCompany. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet weak var musicPlayImage: UIImageView!
    
    var randomLayer:CAGradientLayer!
    var timer = Timer()
    var videoPlayer:AVAudioPlayer!
    var angleDree:CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewTransform()
        let path = Bundle.main.path(forResource: "Kim Taylor-I Am You", ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            videoPlayer = try? AVAudioPlayer.init(contentsOf: NSURL.fileURL(withPath: path!))
            videoPlayer.prepareToPlay()
            videoPlayer.play()
        } catch let error as NSError {
           print(error.localizedDescription)
        }
        
        changeBackColor()
        randomLayer = CAGradientLayer.init()
        var colors:Array<CGColor> = []
        for _ in 1...5 {
            let red = Float(drand48())
            let green = Float(drand48())
            let blue = Float(drand48())
            
            let color = UIColor.init(colorLiteralRed: red, green: green, blue: blue, alpha: 1);
            colors.append(color.cgColor)
        }
        
        
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor
        
        randomLayer.colors = [color1, color2, color3, color4, color5]
        randomLayer.frame = self.view.bounds;
        randomLayer.startPoint = CGPoint.init(x: 0, y: 0);
        randomLayer.endPoint = CGPoint.init(x: 1, y: 1)
        randomLayer.locations = [0.1,0.3,0.5,0.7,0.9];
        self.view.layer.addSublayer(randomLayer);
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (myTimer) in
            self.changeBackColor()
        })
        
    }

    //图片旋转
    func imageViewTransform()  {
        
        //该方法有卡顿现象
//        UIView.animate(withDuration: 0.5, animations: {
//            self.musicPlayImage.transform = CGAffineTransform(rotationAngle: self.angleDree * CGFloat(Double.pi/180))
//        }) { (isFinish) in
//            self.angleDree+=10
//            self.imageViewTransform()
//        }
        
        let animation = CABasicAnimation.init()
        animation.keyPath = "transform.rotation.z"
        animation.toValue = Double.pi * 2.0
        animation.duration = 4
        animation.isCumulative = true
        animation.repeatCount = Float(CGFloat.greatestFiniteMagnitude)
        self.musicPlayImage.layer.add(animation, forKey: "rotationAnimation")
    }
    
    //改变颜色
    func changeBackColor()  {
        let red = Float(drand48())
        let green = Float(drand48())
        let blue = Float(drand48())
        
        let color = UIColor.init(colorLiteralRed: red, green: green, blue: blue, alpha: 1);
        self.view.backgroundColor = color;
    }
}

