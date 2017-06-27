//
//  EffectModelCell.swift
//  005-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/27.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class EffectModelCell: UICollectionViewCell {
    
    fileprivate var effectTitleLabel:UILabel!
    fileprivate var effectImageView:UIImageView!
    fileprivate var effectSubTitleLabel:UILabel!
    fileprivate var ViewW:CGFloat = 0.0
    //设置数据调用方法 赋值
    var effectModel:EffectViewMode!{
        didSet{
           setMyEffectData()
        }
    }
    
    
    fileprivate func setMyEffectData(){
        effectImageView.image =  effectModel.featureImage
        effectTitleLabel.text = effectModel.title
        effectSubTitleLabel.text = effectModel.descrip
        
        effectSubTitleLabel.frame.size.height = effectModel.descrip.heightWithConstrainedWidth(width: ViewW, font: UIFont.systemFont(ofSize: 14))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //设置控件
        ViewW = frame.size.width
        effectImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width:ViewW, height: 350))
        effectImageView.contentScaleFactor = UIScreen.main.scale
        effectImageView.contentMode = .scaleAspectFill
        effectImageView.autoresizingMask = .flexibleHeight
        effectImageView.clipsToBounds = true
        effectImageView.layer.cornerRadius = 5;
        effectImageView.layer.masksToBounds = true
        self.contentView.addSubview(effectImageView)
        
        effectTitleLabel = UILabel.init(frame: CGRect.init(x: 0, y: effectImageView.frame.maxY+10, width: ViewW, height: 20))
        effectTitleLabel.textAlignment = .center
        self.contentView.addSubview(effectTitleLabel)
        
        effectSubTitleLabel = UILabel.init(frame: CGRect.init(x: 0, y: effectTitleLabel.frame.maxY+10, width: ViewW, height: 100))
        effectSubTitleLabel.numberOfLines = 0
        effectSubTitleLabel.textAlignment = .center
        effectSubTitleLabel.font = UIFont.systemFont(ofSize: 14)
        effectSubTitleLabel.textColor = UIColor.init(colorLiteralRed: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        self.contentView.addSubview(effectSubTitleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
}
