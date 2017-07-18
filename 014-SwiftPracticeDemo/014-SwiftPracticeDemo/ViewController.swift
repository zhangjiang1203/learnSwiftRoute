//
//  ViewController.swift
//  014-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/7/14.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate let ViewW = UIScreen.main.bounds.size.width

    override func viewDidLoad() {
        super.viewDidLoad()
        let waveView = ZJDoubleWaveView.init(frame: CGRect.init(x: 0, y: 200, width: ViewW, height: 200))
        waveView.sinFillColor = UIColor.blue.withAlphaComponent(0.6)
        waveView.cosFillColor = UIColor.purple.withAlphaComponent(0.7)
        self.view.addSubview(waveView)
    }

}

