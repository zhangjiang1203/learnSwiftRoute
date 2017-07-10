//
//  ViewController.swift
//  011-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/7/10.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        loginBtn.layer.cornerRadius = 5;
        registerBtn.layer.cornerRadius = 5;
    }
 
}

