//
//  ViewController.swift
//  005-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/26.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource {
    fileprivate var ViewSize = UIScreen.main.bounds.size
    fileprivate var backImage:UIImageView!
    fileprivate var blurView:UIVisualEffectView!
    fileprivate var myCollection:UICollectionView!
    
    fileprivate var myEffectArr = EffectViewMode.createMyInterests()

    override func viewDidLoad() {
        super.viewDidLoad()
        initMyBackAndBlurView()
    }
    
    func initMyBackAndBlurView() {
        backImage = UIImageView.init(frame: self.view.bounds)
        backImage.image = UIImage.init(named: "blue")
        self.view.addSubview(backImage)
        
        let blurEffect:UIBlurEffect = UIBlurEffect.init(style: .light)
        blurView = UIVisualEffectView.init(frame: self.view.bounds)
        blurView.effect = blurEffect
        self.view.addSubview(blurView)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: ViewSize.width, height: ViewSize.height)
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.scrollDirection = .horizontal
        myCollection = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: ViewSize.width, height: ViewSize.height), collectionViewLayout: layout)
        //注册cell
        myCollection.register(EffectModelCell.self, forCellWithReuseIdentifier:"effectCell")
        myCollection.dataSource = self
        myCollection.isPagingEnabled = true
        myCollection.backgroundColor = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0)
        self.view.addSubview(myCollection)
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myEffectArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "effectCell", for: indexPath) as! EffectModelCell
        cell.effectModel = myEffectArr[indexPath.row]
        return cell
    }

}

