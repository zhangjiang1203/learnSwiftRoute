//
//  ViewController.swift
//  007-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/29.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    fileprivate var refreshControl = UIRefreshControl()
    fileprivate var dataList=Array<Int>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加刷新控件
        myTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pullToRefreshMyTableView), for: .valueChanged)
        refreshControl.backgroundColor = UIColor.white
        refreshControl.attributedTitle = NSAttributedString.init(string: "上次刷新\(NSDate())", attributes: [NSForegroundColorAttributeName:UIColor.black])
        refreshControl.tintColor = UIColor.black
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "systemCell")
    }
    
    func pullToRefreshMyTableView() {
        print("开始刷新数据")
        let index = dataList.count
        
        for i in index...index+5 {
            dataList.append(i)
        }
        myTableView.reloadData();
        myTableView.scrollToRow(at:NSIndexPath.init(row: dataList.count-1, section: 0) as IndexPath, at: .bottom, animated: true)
        refreshControl.endRefreshing();
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "systemCell", for: indexPath) as UITableViewCell;
        cell.textLabel?.text = String.init(format: "测试数据刷新===%d",dataList[indexPath.row])
        return cell
        
    }


}

