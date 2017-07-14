//
//  ZJDoubleWaveView.swift
//  013-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/7/13.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

enum KWaveType {
    case sin
    case cos
}



class ZJDoubleWaveView: UIView {
    
    /// view的尺寸
    fileprivate var viewSize:CGSize!
    
    /// sin图层
    fileprivate var sinLayer:CAShapeLayer!
    
    /// cos图层
    fileprivate var cosLayer:CAShapeLayer!
    
    /// 定时器
    fileprivate var displayLink:CADisplayLink!
    
    /// 水波高度
    fileprivate var waterWageHeight:Double = 0
    
    /// Y轴方向的缩放
    fileprivate var zoomY:Double = 6
    
    /// X轴方向的偏移量
    fileprivate var translateX:Double = 0
    
    /// 震动的频率
    fileprivate var frequency:Double = 1
    
    /*属性分为计算属性和存储属性
     
     计算型属性是什么
     计算型属性是通过计算而得出来的属性，这种属性相区别于存储属性这种属性是不会存储的。如果是计算型属性，那么提供setter方法那就一定需要提供getter方法，可以直接只有一个getter方法，其实仔细想一想这样的设计是有缘由的，计算型属性我们是为了得出什么？我们是为了获取计算出来的值，那么你提供了setter方法，不提提供getter方法（他又不会存储）那么你是不能得到想要的值的，setter方法他会将新值保存在一个叫newValue中，我们可以直接用，当然getter中也有一个newValue
     
     存储型属性是什么
     存储型属性就是一个需要存储的属性，如果我们需要自定义setter和getter方法，我们得注意一下，setter方法存在两种，willSet和didSet，这两种方法我们不一定都需要实现，根据需求实现各自的方法，willSet是将要赋值的时候调用的，而didSet方法是已经赋完了值之后调用的。可以提供他的getter方法，和计算型属性不一样的是，他可以有setter方法没有getter，想想设计也是相当的合理，既然他是存储型的属性，已经存起来了，那么我们可以取得到。在willSet方法里没有必要赋值，除非你要改变新赋的值，getter方法和setter 方法不能同时出现
     
     关键字 final
     final 关键字可以修饰类，结构体等等。他的含义是避免子类继承和修改
     */
    /// sin图层填充颜色
    var sinFillColor:UIColor = UIColor.init(colorLiteralRed: 86/255.0, green: 202/255.0, blue: 139/255.0, alpha: 1){
        didSet{
            sinLayer.fillColor = sinFillColor.cgColor;
            sinLayer.strokeColor = sinFillColor.cgColor;
        }
    }
    
    /// cos图层填充颜色
    var cosFillColor:UIColor = UIColor.init(colorLiteralRed: 200/255.0, green: 40/255.0, blue: 30/255.0, alpha: 1){
        didSet{
            cosLayer.fillColor = cosFillColor.cgColor;
            cosLayer.strokeColor = cosFillColor.cgColor;
        }
    }
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSize = frame.size
        waterWageHeight = Double(viewSize.height)/2.0
        setUpMyShowWaveLayer()
        startDisplayLink()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSize = self.bounds.size;
        waterWageHeight = Double(viewSize.height)/2.0
        setUpMyShowWaveLayer()
        startDisplayLink()
    }
    
    //初始化参数
    func setUpMyShowWaveLayer() {
    
        sinLayer = CAShapeLayer.init()
        sinLayer.fillColor = sinFillColor.cgColor
        sinLayer.path = waterWavePathWithType(type: .sin)
        sinLayer.lineWidth = 0.1
        sinLayer.strokeColor = sinFillColor.cgColor
        self.layer.addSublayer(sinLayer)
        
        cosLayer = CAShapeLayer.init()
        cosLayer.fillColor = cosFillColor.cgColor
        cosLayer.path = waterWavePathWithType(type: .cos)
        cosLayer.lineWidth = 0.1
        cosLayer.strokeColor = cosFillColor.cgColor
        self.layer.addSublayer(cosLayer)
    }
    
    //绘制路径
    func waterWavePathWithType(type:KWaveType) -> CGPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 0, y: self.waterWageHeight))
        var y = 0.0
        for x in 0...Int(viewSize.width) {
            if type == .sin {
                y = self.zoomY*sin(self.frequency * Double(x) * Double.pi/180.0 - self.translateX * Double.pi/180.0) + self.waterWageHeight
            }else{
                y = self.zoomY*cos(self.frequency * Double(x) * Double.pi/180.0 - self.translateX * Double.pi/180.0) + self.waterWageHeight
            }
            path.addLine(to: CGPoint.init(x: Double(x), y: y))
        }
        path.addLine(to: CGPoint.init(x: viewSize.width, y: viewSize.height))
        path.addLine(to: CGPoint.init(x: 0, y: viewSize.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.waterWageHeight))
        path.close()
        
        return path.cgPath;
    }
    
    func updateMyWaveAnimation()  {
        self.translateX += 5
        if self.zoomY <= 10 && self.zoomY >= 6 {
            self.zoomY += 0.02
        }else{
            self.zoomY -= 0.02
        }
        self.sinLayer.path = waterWavePathWithType(type: .sin)
        self.cosLayer.path = waterWavePathWithType(type: .cos)
    }
    
    //开启定时器
    func startDisplayLink(){
        self.displayLink = CADisplayLink.init(target: self, selector: #selector(updateMyWaveAnimation))
        self.displayLink.add(to: RunLoop.current, forMode: .defaultRunLoopMode)
    }
    
    //停止定时器
    func stopDisplayLink()  {
        self.displayLink.invalidate()
        self.displayLink =  nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
