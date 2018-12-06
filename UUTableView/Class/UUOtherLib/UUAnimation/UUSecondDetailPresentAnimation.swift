//
//  UUSecondDetailPresentAnimation.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import Foundation
import UIKit

class UUSecondDetailPresentAnimation: NSObject, UUTransitionAnimationDelegate {
    
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let toVC = transitionContext.viewController(forKey: .to) as? UUSecondDetailVC else {
            return
        }
        
        let contentView = transitionContext.containerView
        contentView.addSubview(fromVC.view)
        contentView.addSubview(toVC.view)
        
        let view = UUMaskView()
        view.frame = toVC.view.bounds
        view.frame.size.width = 60
        view.tag = 100
        view.vc = toVC
        toVC.view.addSubview(view)
        let alpha = toVC.bg.alpha
        toVC.bg.alpha = 0
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                view.alpha = 1
                toVC.bg.alpha = alpha
                toVC.detailView.frame.origin.x = 60
            })
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            if !transitionContext.transitionWasCancelled {
                contentView.addSubview(fromVC.view)
                contentView.bringSubviewToFront(toVC.view)
            } else {
                view.removeFromSuperview()
            }
        }
    }
}

