//
//  UUMineDismissAnimation.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit
import Foundation
import UIKit

class UUMineDismissAnimation: NSObject, UUTransitionAnimationDelegate {
    
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? MineViewController else {
            return
        }
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        let view = toVC.view.viewWithTag(100)
        let contentView = transitionContext.containerView
        contentView.addSubview(fromVC.view)
        contentView.addSubview(toVC.view)
        var labelFinalFrame = fromVC.label.frame
        var btnFinalFrame = fromVC.backBtn.frame
        labelFinalFrame.origin.x += 50
        labelFinalFrame.origin.y -= 20
        btnFinalFrame.origin.x += 50
        btnFinalFrame.origin.y += 20
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                toVC.view.frame = kScreenBounds
                fromVC.label.frame = labelFinalFrame
                fromVC.backBtn.frame = btnFinalFrame
                view?.alpha = 0
            })
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            if !transitionContext.transitionWasCancelled {
                view?.removeFromSuperview()
            }
        }
    }
}

