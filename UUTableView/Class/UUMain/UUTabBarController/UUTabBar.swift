//
//  UUTabBar.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class UUTabBar: UITabBar {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if !isHidden {
            for subView in subviews {
                let tp = subView.convert(point, from: self)
                if subView is UUTabBarView {
                    for item in subView.subviews {
                        if item is UUTabBarItem {
                            if item.frame.contains(tp) {
                                return item
                            }
                        }
                    }
                }
            }
        }
        return view
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
