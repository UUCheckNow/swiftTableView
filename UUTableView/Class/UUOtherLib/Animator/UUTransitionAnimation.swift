//
//  UUTransitionAnimation.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

protocol UUTransitionAnimationDelegate {
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval)
}

class UUTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration: TimeInterval = 1
    var delegate: UUTransitionAnimationDelegate?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        delegate?.animateAction(transitionContext: transitionContext, duration: duration)
    }
}


