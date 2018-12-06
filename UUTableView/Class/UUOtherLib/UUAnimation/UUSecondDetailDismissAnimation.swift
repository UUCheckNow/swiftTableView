//
//  UUSecondDetailDismissAnimation.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import Foundation
import UIKit

class UUSecondDetailDismissAnimation: NSObject, UUTransitionAnimationDelegate {
    
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? UUSecondDetailVC else {
            return
        }
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        let view = fromVC.view.viewWithTag(100)
        let contentView = transitionContext.containerView
        contentView.addSubview(toVC.view)
        contentView.addSubview(fromVC.view)
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                fromVC.bg.alpha = 0
                fromVC.detailView.frame.origin.x = kScreenWidth
            })
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            if !transitionContext.transitionWasCancelled {
                view?.removeFromSuperview()
            }
        }
    }
}
