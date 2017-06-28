//
//  ViewController.swift
//  006-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/28.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    fileprivate var locationName:UILabel!
    fileprivate var locationBtn:UIButton!
    var viewWidth = UIScreen.main.bounds.size.width
    
    lazy var locationMan:CLLocationManager = {
        () -> CLLocationManager in
        let tempLoc = CLLocationManager.init()
        tempLoc.delegate = self as CLLocationManagerDelegate
        //每隔多少米移动一次
        tempLoc.distanceFilter = kCLDistanceFilterNone
        tempLoc.requestAlwaysAuthorization()
        //设置定位的精度 精度越高 越耗电
        tempLoc.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        return tempLoc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBlurImage()
        self.locationMan.startUpdatingLocation()
        
    }
    
    //添加玻璃模糊效果
    func createBlurImage() {
        let blurEffect:UIBlurEffect = UIBlurEffect.init(style: .light)
        let blurView:UIVisualEffectView = UIVisualEffectView.init(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view.addSubview(blurView)
        
        //添加label
        locationName = UILabel.init(frame: CGRect.init(x: 20, y: 80, width: viewWidth-40, height: 40))
        locationName.textColor = UIColor.white
        locationName.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(locationName)
        
        //添加按钮
        locationBtn = UIButton.init(frame: CGRect.init(x: 20, y: 200, width: viewWidth-40, height: 40))
        locationBtn.addTarget(self, action: #selector(buttonClickToGetLocation), for: .touchUpInside)
        locationBtn.setTitle("获取位置", for: .normal)
        locationBtn.backgroundColor = UIColor.purple
        locationBtn.layer.cornerRadius = 5;
        locationBtn.layer.masksToBounds = true
        self.view.addSubview(locationBtn)

    }
    
    //获取地理位置
    func buttonClickToGetLocation() {
        //判断定位服务是否开启
        if CLLocationManager.locationServicesEnabled(){
            //开始定位
            locationMan.startUpdatingLocation()
        }else{
            print("请打开位置信息");
        }
    }
    
    
    //开始定位的代理方法
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //反地理编码获取地理信息
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler:{(placemarks,error)->Void in
            if (error != nil) {
                self.locationName.text = "获取地理信息失败"+error!.localizedDescription
                return
            }
            
            if placemarks!.count > 0 {
                let p = placemarks?.first
                self.locationMan.stopUpdatingLocation()
             
                var cityStr : String;
                var provStr : String;
                var sublocalityStr : String;
                var local:String
                
                let placeDic = p?.addressDictionary! as! NSDictionary;
                cityStr = placeDic.object(forKey: "City") as! String;
                provStr = placeDic.object(forKey: "State") as! String;
                sublocalityStr = placeDic.object(forKey: "SubLocality") as! String;
                local = placeDic.object(forKey: "Thoroughfare") as! String
                self.locationName.text = provStr+cityStr+sublocalityStr+local
                
                
            }else{
                self.locationName.text = "定位失败"
            }
        })
        
    }


}

