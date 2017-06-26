//
//  MySecondViewController.swift
//  004-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/22.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit
import AVFoundation
class MySecondViewController: UIViewController {
    var screenW = UIScreen.main.bounds.size.width
    var screenH = UIScreen.main.bounds.size.height
    // MARK:- 相机属性
    fileprivate lazy var session : AVCaptureSession = AVCaptureSession()
    fileprivate lazy var inputDevice : AVCaptureDeviceInput = AVCaptureDeviceInput() //输入源
    fileprivate lazy var imageOutput : AVCaptureStillImageOutput = AVCaptureStillImageOutput() //输出
    lazy var priviewLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer() //视
    fileprivate var videoInput : AVCaptureDeviceInput?
    fileprivate var currentD :AVCaptureDevice!
    //定义视图 添加拍照 闪光灯 缩放 镜头翻转效果
    var cameraBtn:UIButton!
    var flashBtn:UIButton!
    var switchShot:UIButton!
    
    fileprivate var effectiveScale:CGFloat = 1.0 //默认缩放
    fileprivate var beginGestureScale:CGFloat = 1.0 //
    fileprivate let maxScale:CGFloat = 2.0 //最大缩放
    fileprivate let minScale:CGFloat = 1.0 //最小缩放
    var customView:ChooseLightTypeView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initMyCameraSetting()
        addActionButton()
    }
    
    func initMyCameraSetting()  {
        // 1.创建输入
        // 1.1.获取所有的设备（包括前置&后置摄像头）
        guard let devices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo) as? [AVCaptureDevice] else { return }
        // 1.2.取出获取前置摄像头
        guard let d = devices.filter({ return $0.position == .back }).first else{ return}
        currentD = d
        // 1.3.通过前置摄像头创建输入设备
        guard let inputDevice = try? AVCaptureDeviceInput(device: d) else { return }
        self.videoInput = inputDevice
        
        //输出
        imageOutput = AVCaptureStillImageOutput()
        imageOutput.outputSettings = [AVVideoCodecKey:AVVideoCodecJPEG]
        
        //加入
        if session.canAddInput(inputDevice) == true {
            session.addInput(self.videoInput)
        }
        if session.canAddOutput(imageOutput) == true {
            session.addOutput(imageOutput)
        }
        
        //视图
        priviewLayer = AVCaptureVideoPreviewLayer(session:session)
        priviewLayer.frame = self.view.bounds;
        priviewLayer.videoGravity = AVLayerVideoGravityResizeAspect
        priviewLayer.connection.videoOrientation = .portrait
        self.view.layer.addSublayer(priviewLayer)
        
        //闪光灯
        do{ try d.lockForConfiguration() }catch{ }
        if d.hasFlash == false { return }
        d.flashMode = AVCaptureFlashMode.on
        d.unlockForConfiguration()
    }
    
    //添加按钮
    func addActionButton() {
        
        let buttonW = 50,smallBtnW = 40
        cameraBtn = UIButton.init(frame: CGRect.init(x: 0, y: Int(screenH - 60), width: buttonW, height: buttonW))
        cameraBtn.center.x = self.view.center.x
        cameraBtn.setTitle("拍照", for: .normal)
        cameraBtn.backgroundColor = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.5);
        cameraBtn.layer.cornerRadius = CGFloat(buttonW/2);
        cameraBtn.layer.masksToBounds = true
        cameraBtn.tag = 1
        cameraBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        cameraBtn.addTarget(self, action: #selector(cameraButtonClickAction(sender:)), for: .touchUpInside)
        self.view.addSubview(cameraBtn)
        
        customView = ChooseLightTypeView.init(frame: CGRect.init(x: 20, y: Int(screenH - 50), width: smallBtnW, height: smallBtnW))
        //闭包调用,避免self的循环引用
        customView.buttonCallBack={
            [unowned self](num) in
            self.flashLamp(mode: num)
        }
        self.view.addSubview(customView)
        
        switchShot = UIButton.init(frame: CGRect.init(x: Int(screenW-60), y: Int(screenH - 50), width: smallBtnW, height: smallBtnW))
        switchShot.setTitle("翻转", for: .normal)
        switchShot.backgroundColor = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.5);
        switchShot.layer.cornerRadius = CGFloat(smallBtnW/2);
        switchShot.layer.masksToBounds = true
        switchShot.tag = 3
        switchShot.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        switchShot.addTarget(self, action:#selector(cameraButtonClickAction(sender:)), for:.touchUpInside)
        self.view.addSubview(switchShot)
    }
    
    
    func cameraButtonClickAction(sender:UIButton) {
        switch sender.tag {
        case 1:
            takePhoto(finishedCallback: { [unowned self] (image) in
                print("拍照成功");
            })
            break
        case 2:
            sender.isSelected = !sender.isSelected
            sender.setTitle(sender.isSelected ?"打开":"关闭", for: .normal)
            flashLamp(mode: sender.isSelected ?1:0)
            break
        case 3:
            beforeAfterCamera()
            break
        default:
            break
        }
    }
    
    //拍照
    func takePhoto(finishedCallback :  @escaping (_ result : UIImage ) -> ()){
        let captureConnetion = imageOutput.connection(withMediaType: AVMediaTypeVideo)
        captureConnetion?.videoScaleAndCropFactor = effectiveScale
        imageOutput.captureStillImageAsynchronously(from: captureConnetion) { (imageBuffer, error) in
            let jpegData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageBuffer)
            let jpegImage = UIImage(data: jpegData!)
            //图片入库
            UIImageWriteToSavedPhotosAlbum(jpegImage!, self,nil, nil)
            finishedCallback(jpegImage!)
        }
    }
    
    //打开关闭闪光灯
    func flashLamp(mode:Int) {
        do {
            try currentD.lockForConfiguration()
        } catch  {}
        if currentD.hasFlash == false {return}
        currentD.flashMode = AVCaptureFlashMode(rawValue: mode)!
        currentD.unlockForConfiguration()
        
    }

    //翻转镜头
    func beforeAfterCamera(){
        //获取之前的镜头
        guard var position = videoInput?.device.position else { return }
        //获取当前应该显示的镜头
        position = position == .front ? .back : .front
        //创建新的device
        guard let devices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo) as? [AVCaptureDevice] else { return }
        // 1.2.取出获取前置摄像头
        let d = devices.filter({ return $0.position == position }).first
        currentD = d
        //input
        guard let videoInput = try? AVCaptureDeviceInput(device: d) else { return }
        
        //切换
        session.beginConfiguration()
        session.removeInput(self.videoInput!)
        session.addInput(videoInput)
        session.commitConfiguration()
        self.videoInput = videoInput
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        session.stopRunning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        session.startRunning()
    }

}
