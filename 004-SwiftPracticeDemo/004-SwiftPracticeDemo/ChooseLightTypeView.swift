//
//  ChooseLightTypeView.swift
//  004-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/22.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ChooseLightTypeView: UIView {
    //定义闭包 类似于block
    var buttonCallBack:((Int)->())!
    var viewH:CGFloat!
    let buttonW = 40,padding=10
    var cameraBtn:UIButton!
    var isClose:Bool!
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        isClose = false
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = true
        viewH = frame.size.height
        
        //添加一个大按钮
        cameraBtn = UIButton.init(frame: CGRect.init(x: 0, y: Int(viewH-40), width: buttonW, height: buttonW))
        cameraBtn.setTitle("灯光", for: .normal)
        cameraBtn.backgroundColor = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.5)
        cameraBtn.layer.cornerRadius = CGFloat(buttonW/2)
        cameraBtn.layer.masksToBounds = true
        cameraBtn.tag = 10
        cameraBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        cameraBtn.addTarget(self, action: #selector(cameraButtonClickAction(sender:)), for: .touchUpInside)
        self.addSubview(cameraBtn)
        
        addChooseButtonItem()
        
    }
    
    //添加控件
    func addChooseButtonItem()  {
        let stringNames = ["自动","打开","关闭"]
        for (index, value) in stringNames.enumerated() {
            let cameraBtn = UIButton.init(frame: CGRect.init(x: 0, y: (buttonW+padding)*(index+1), width: buttonW, height: buttonW))
            cameraBtn.setTitle(value, for: .normal)
            cameraBtn.backgroundColor = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.5)
            cameraBtn.layer.cornerRadius = CGFloat(buttonW/2)
            cameraBtn.layer.masksToBounds = true
            cameraBtn.tag = index+11
            cameraBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            cameraBtn.addTarget(self, action: #selector(cameraButtonClickAction(sender:)), for: .touchUpInside)
            self.addSubview(cameraBtn)
        }
    }
    
    func cameraButtonClickAction(sender:UIButton) {
        switch sender.tag {
        case 10:
            isClose = !isClose;
            //修改View的高度
            if isClose {
                openChooseLightType()
            }else{
                closeChooseLightType()
            }
            break
        case 11:fallthrough
        case 12:fallthrough
        case 13:
            isClose = false
            buttonCallBack(sender.tag-11)
            closeChooseLightType()
        default:
            break
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //打开选择灯光
    func openChooseLightType()  {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 5.5, options: .curveEaseInOut, animations: { 
            var viewFrame = self.frame
            viewFrame.size.height = CGFloat(4*self.buttonW+3*self.padding)
            viewFrame.origin.y = self.frame.maxY - CGFloat(4*self.buttonW+3*self.padding)
            self.frame = viewFrame
            self.cameraBtn.frame = CGRect.init(x: 0, y: Int(self.frame.size.height-40), width: self.buttonW, height: self.buttonW)
            //设置三个按钮
            for i in 0..<3 {
                let button = self.viewWithTag(11+i);
                button?.frame = CGRect.init(x: 0, y: (self.buttonW+self.padding)*i, width: self.buttonW, height: self.buttonW)
            }
        }, completion: nil)
    }
    
    //关闭选择灯光
    func closeChooseLightType()  {
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 5.5, options: .curveEaseInOut, animations: {
            var viewFrame = self.frame
            viewFrame.size.height = 40
            viewFrame.origin.y = self.frame.maxY - 40
            self.frame = viewFrame
            self.cameraBtn.frame = CGRect.init(x: 0, y: Int(self.frame.size.height-40), width: self.buttonW, height: self.buttonW)
            for i in 0..<3 {
                let button = self.viewWithTag(11+i);
                button?.frame = CGRect.init(x: 0, y: (self.buttonW+self.padding)*(i+1), width: self.buttonW, height: self.buttonW)
            }
        }, completion: nil)
    }

}
