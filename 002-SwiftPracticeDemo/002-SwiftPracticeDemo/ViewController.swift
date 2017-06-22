//
//  ViewController.swift
//  002-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/21.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var changeBtn: UIButton!
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //切换改变字体
    @IBAction func changeFont(_ sender: UIButton) {
        
        fontRowIndex = (fontRowIndex+1)%5;
        
        self.infoTextView.font = UIFont.init(name: fontNames[fontRowIndex], size: 23)
        sender.titleLabel?.font = UIFont.init(name: fontNames[fontRowIndex], size: 18)
        
    }


}

