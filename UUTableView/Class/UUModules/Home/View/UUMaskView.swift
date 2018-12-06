//
//  UUMaskView.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class UUMaskView: UIView {

    var vc:UIViewController? {
        didSet {
            if let mine = vc as? MineViewController {
                mine.animator.helper.vc = mine
                mine.animator.helper.isReverse = true
            } else if let secondDetail = vc as? UUSecondDetailVC {
                secondDetail.animator.helper.vc = secondDetail
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .clear
        alpha = 0
        let tap = UITapGestureRecognizer(target: self, action: #selector(UUMaskView.tap))
        addGestureRecognizer(tap)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(UUMaskView.pan))
        addGestureRecognizer(pan)
    }
    
    @objc func tap() {
        vc?.dismiss(animated: true, completion: nil)
    }
    
    @objc func pan(gesture: UIPanGestureRecognizer) {
        if let mine = vc as? MineViewController {
            mine.animator.helper.panGesture(pan: gesture)
        } else if let secondDetail = vc as? UUSecondDetailVC {
            secondDetail.animator.helper.panGesture(pan: gesture)
        }
    }

}
