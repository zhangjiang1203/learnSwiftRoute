//
//  UITableView+LoadAnimation.swift
//  012-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/7/11.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

enum AnimationDerect:Int {
    case top    = 0
    case bottom = 1
    case left   = 2
    case right  = 3
}


extension UITableView{
    
    
    /// UITableView重新加载动画
    ///
    /// - Parameters:
    ///   - animation: cell运动方向
    ///   - time: 动画持续时间
    ///   - interValTime: 每个cell动画间隔时间
    func reloadData(_ animation:AnimationDerect, animtionTime time:TimeInterval , interValTime:TimeInterval) {
        self.setContentOffset(self.contentOffset, animated: true)
        UIView.animate(withDuration: 0.2, animations: { 
            self.isHidden = true
            self.reloadData()
        }) { (finish) in
            self.isHidden = false
            self.visibleRowsBeginAnimation(animation, animtionTime: time, interValTime: interValTime)
        }
    }
    
    fileprivate func visibleRowsBeginAnimation(_ animation:AnimationDerect, animtionTime time:TimeInterval , interValTime:TimeInterval )  {
        let visibleArr = self.indexPathsForVisibleRows;
        let count = visibleArr?.count
        
        switch animation {
        case .top:
            for i in 0 ..< count!{
                let path = visibleArr?[i]
                let cell = self.cellForRow(at: path!)
                cell?.isHidden = true
                let cellCenter = cell?.center
                
                cell?.center = CGPoint.init(x: (cell?.frame.size.width)!, y: (cellCenter?.y)!-1000)
                //添加动画
                UIView.animate(withDuration:(time+TimeInterval(i)*interValTime), delay: 0.0, options: .curveEaseOut, animations: {
                    cell?.center = CGPoint.init(x: (cellCenter?.x)!, y: (cellCenter?.y)!+2)
                    cell?.isHidden = false
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseOut, animations: { 
                        cell?.center = CGPoint.init(x: (cellCenter?.x)!, y: (cellCenter?.y)!-2)
                    }, completion: { (finish) in
                        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                            cell?.center = cellCenter!
                        }, completion: nil)
                    })
                })
            }
            break
        case .bottom:
            for i in 0 ..< count!{
                let path = visibleArr?[i]
                let cell = self.cellForRow(at: path!)
                cell?.isHidden = true
                let cellCenter = cell?.center
                
                cell?.center = CGPoint.init(x: (cell?.frame.size.width)!, y: (cellCenter?.y)!+1000)
                //添加动画
                UIView.animate(withDuration:(time+TimeInterval(i)*interValTime), delay: 0.0, options: .curveEaseOut, animations: {
                    cell?.center = CGPoint.init(x: (cellCenter?.x)!, y: (cellCenter?.y)!-2)
                    cell?.isHidden = false
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                        cell?.center = CGPoint.init(x: (cellCenter?.x)!, y: (cellCenter?.y)!+2)
                    }, completion: { (finish) in
                        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                            cell?.center = cellCenter!
                        }, completion: nil)
                    })
                })
            }
            break
        case .left:
            for i in 0 ..< count!{
                let path = visibleArr?[i]
                let cell = self.cellForRow(at: path!)
                cell?.isHidden = true
                let cellCenter = cell?.center
                
                cell?.center = CGPoint.init(x: -(cell?.frame.size.width)!, y: (cellCenter?.y)!)
                //添加动画
                UIView.animate(withDuration:(time+TimeInterval(i)*interValTime), delay: 0.0, options: .curveEaseOut, animations: {
                    cell?.center = CGPoint.init(x: (cellCenter?.x)!-2, y: (cellCenter?.y)!)
                    cell?.isHidden = false
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: { 
                        cell?.center = CGPoint.init(x: (cellCenter?.x)!+2, y: (cellCenter?.y)!)
                    }, completion: { (finish) in
                        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                            cell?.center = cellCenter!
                        }, completion: nil)
                    })
                })
            }
            break
        case .right:
            for i in 0 ..< count!{
                let path = visibleArr?[i]
                let cell = self.cellForRow(at: path!)
                cell?.isHidden = true
                let cellCenter = cell?.center
                cell?.center = CGPoint.init(x: (cell?.frame.size.width)!*3, y: (cellCenter?.y)!)
                //添加动画
                UIView.animate(withDuration:(time+TimeInterval(i)*interValTime), delay: 0.0, options: .curveEaseOut, animations: {
                    cell?.center = CGPoint.init(x: (cellCenter?.x)!+2, y: (cellCenter?.y)!)
                    cell?.isHidden = false
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                        cell?.center = CGPoint.init(x: (cellCenter?.x)!-2, y: (cellCenter?.y)!)
                    }, completion: { (finish) in
                        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                            cell?.center = cellCenter!
                        }, completion: nil)
                    })
                })
            }
            break
            
        }
    }
}
