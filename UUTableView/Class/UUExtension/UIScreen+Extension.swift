//
//  UIScreen+Extension.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    
    static var width : CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }
    
    static var height : CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }
    
    static var size : CGSize {
        get {
            return UIScreen.main.bounds.size
        }
    }

    static func isIphone4_5() -> Bool {
        return UIScreen.width == 320 ? true : false
    }
    
    static func isIpone6_7() -> Bool {
        return UIScreen.width == 375 ? true : false
    }
    
    static func isIpone6_7_Plus() -> Bool {
        return UIScreen.width == 414 ? true : false
    }
    
    static func isIphoneX() -> Bool {
        let height = UIScreen.main.bounds.size.height
        return height >= 737 && height <= 812
    }
//    状态栏高度
    static var statusBarHeight: CGFloat {
        get {
            return isIphoneX() ? 44 : 20
        }
    }
//    导航栏高度
    static var naviBarHeight:CGFloat {
        get {
            return isIphoneX() ? 88 : 64
        }
    }
//    tabbar高度
    static var tabBarHeight:CGFloat {
        get {
            return isIphoneX() ? 83 : 49
        }
    }
//    底部高度
    static var homeIndicatorMoreHeight:CGFloat {
        get {
            return isIphoneX() ? 34 : 0
        }
    }
    
    static var statusBarMoreHeight:CGFloat {
        get {
            return isIphoneX() ? 24 : 0
        }
    }
    
    
}
