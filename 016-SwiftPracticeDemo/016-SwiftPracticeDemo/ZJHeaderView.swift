//
//  ZJHeaderView.swift
//  016-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/7/25.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ZJHeaderView: UIView {

    @IBOutlet weak var myImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.setImageViewFit()
    }
}

extension UIImageView {
    func setImageViewFit()  {
        self.contentScaleFactor = UIScreen.main.scale
        self.contentMode = .scaleAspectFill
        self.autoresizingMask = .flexibleHeight
        self.clipsToBounds = true
    }
}
