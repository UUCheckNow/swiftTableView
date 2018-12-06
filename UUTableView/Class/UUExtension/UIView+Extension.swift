//
//  UIView+Extension.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var left : CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var rect = frame
            rect.origin.x = newValue
            frame = rect
        }
    }
    
    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set {
            var rect = frame
            rect.origin.x = newValue - rect.size.width
            frame = rect
        }
    }
    
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var rect = frame
            rect.origin.y = newValue
            frame = rect
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set {
            var rect = frame
            rect.origin.y = newValue - frame.size.height
            frame = rect
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            var rect = frame
            rect.size.width = newValue
            frame = rect
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            var rect = frame
            rect.size.height = newValue
            frame = rect
        }
    }
    
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    
    func filterCircle(color: UIColor, size: CGFloat) {
        backgroundColor = color
        layer.borderWidth = 1
        layer.cornerRadius = size / 2
        isUserInteractionEnabled = false
        switch color {
        case .lvWhite1A3:
            layer.borderColor = UIColor.lvGray3A6.cgColor
        case .lvBlue4A8:
            layer.borderColor = UIColor.lvBlue4.cgColor
        case .lvYellow1A8:
            layer.borderColor = UIColor.lvYellow1.cgColor
        case .lvGreen1A8:
            layer.borderColor = UIColor.lvGreen1.cgColor
        case .lvRed1A8:
            layer.borderColor = UIColor.lvRed1.cgColor
        default:break
        }
    }
    
    
}

