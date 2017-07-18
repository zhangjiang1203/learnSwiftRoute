//
//  LoginViewController.swift
//  011-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/7/10.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let viewW = UIScreen.main.bounds.size.width

    @IBOutlet weak var accountField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.setBackgroundImage(imageWithColor(color: UIColor.clear), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(imageWithColor(color: UIColor.clear), for: .default)
        accountField.layer.cornerRadius = 5
        passwordField.layer.cornerRadius = 5
        loginBtn.layer.cornerRadius = 5
        //初始化参数值
        
        self.accountField.frame.origin.x = -viewW
        self.passwordField.frame.origin.x = -viewW
        self.loginBtn.center.x = -viewW/2
        //设置刚开始的动画
        UIView.animate(withDuration: 0.5) {
            self.accountField.frame.origin.x = 30
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: UIViewAnimationOptions(rawValue: 0), animations: {
            self.passwordField.frame.origin.x = 30
            self.loginBtn.center.x = self.viewW/2;
        }, completion: nil)
    }
    
    
    
    
    @IBAction func loginBtnClickAction(_ sender: UIButton) {
        var bounds = sender.bounds
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            bounds.origin.x = bounds.origin.x-30
            bounds.size.width = bounds.width+60
        }else{
            bounds.origin.x = bounds.origin.x+30
            bounds.size.width = bounds.width-60
        }
        UIView.animate(withDuration: 1.0, delay: 0.3, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.loginBtn.bounds = bounds
            self.loginBtn.isEnabled = false
        }) { (isFinish) in
            self.loginBtn.isEnabled = true
        }
    }
    
    func imageWithColor(color:UIColor) -> UIImage {
        let rect = CGRect.init(x: 0.0, y: 0.0, width: 1.0, height: 1.0);
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
