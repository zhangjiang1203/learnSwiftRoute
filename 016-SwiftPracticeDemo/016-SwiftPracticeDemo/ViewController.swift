//
//  ViewController.swift
//  016-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/7/25.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    fileprivate let viewHeight:CGFloat = 400
    fileprivate let speed:CGFloat = 0.6
    
    
    fileprivate var headerView:ZJHeaderView!
    fileprivate var headerFrame:CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headerView = Bundle.main.loadNibNamed("ZJHeaderView", owner: nil, options: nil)?.last as! ZJHeaderView
        self.view.insertSubview(self.headerView, at: 0)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "systemCell")
        
        self.tableView.contentInset = UIEdgeInsetsMake(viewHeight, 0, 0, 0 )
        self.tableView.setContentOffset(CGPoint.init(x: 0, y: -viewHeight), animated: false)
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "systemCell", for: indexPath) as UITableViewCell;
        cell.textLabel?.text = String.init(format: "测试数据刷新===%d",indexPath.row)
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var org = CGRect.init(x: 0, y: -viewHeight, width: self.view.frame.size.width, height: viewHeight)
        org.origin.y = scrollView.contentOffset.y * speed - viewHeight * (1 - speed)
        self.headerFrame = org
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.headerView.frame = self.headerFrame
    }

    


}

