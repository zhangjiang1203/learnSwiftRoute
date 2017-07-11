//
//  ViewController.swift
//  012-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/7/11.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var myTableView: UITableView!
    var indexItem:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "systemCell")
        
        let rightBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 30))
        rightBtn.setTitleColor(UIColor.black, for: .normal)
        rightBtn.setTitle("切换", for: .normal)
        rightBtn.addTarget(self, action: #selector(changeTableviewAnimation(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBtn)
    }
    
    func changeTableviewAnimation(_ sender: UIButton) {
        if indexItem >= 3{
            indexItem = 0
        }else{
            indexItem += 1;
        }
        self.myTableView.reloadData(AnimationDerect(rawValue: indexItem)!, animtionTime: 0.5, interValTime: 0.1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "systemCell", for: indexPath)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        cell.textLabel?.text = String.init(format: "这就是显示的数据===%d", indexPath.row)
        cell.textLabel?.textColor = UIColor.white
        return cell;
    }
}

