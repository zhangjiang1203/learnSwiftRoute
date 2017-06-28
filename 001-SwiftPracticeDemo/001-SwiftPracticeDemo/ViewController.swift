//
//  ViewController.swift
//  001-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/21.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    //添加定时器
    var myTimer:Timer!
    var count = 0.0
    var isPlay = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = String(count)
        
    }
    
    @IBAction func testDemoButtonAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            isPlay = false
            myTimer.invalidate()
            self.infoLabel.text = "0.0"
            let button:UIButton = self.view.viewWithTag(3) as! UIButton
            button.isSelected = true
            count = 0.0
            break
        case 2:
            if !isPlay{
                isPlay = true
                myTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (myTimer) in
                    self.count+=0.1
                    self.infoLabel.text = String(format:"%.1f",self.count)
                })
            }
            break
        case 3:
            if isPlay{
                sender.isSelected = !sender.isSelected;
                if sender.isSelected {
                    myTimer.fireDate = NSDate.distantPast
                }else{
                    myTimer.fireDate = NSDate.distantFuture
                }
            }
            break
        default:
            break
        }
    }

    

}

