//
//  AppDelegate.swift
//  015-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/7/21.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,CAAnimationDelegate {

    var window: UIWindow?
    var maskView = MaskAnimationView()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UIViewController()
        
        maskView = MaskAnimationView.init(frame: UIScreen.main.bounds)
        self.window?.addSubview(maskView);
        maskView.animationMask()
        
        self.window!.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        self.window!.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}

