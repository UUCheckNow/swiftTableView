//
//  UUThirdDetailPresentAnimation.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import Foundation
import UIKit

class UUThirdDetailPresentAnimation: NSObject, UUTransitionAnimationDelegate {
    
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let toVC = transitionContext.viewController(forKey: .to) as? UUThirdDetailVC else {
            return
        }
        
        let contentView = transitionContext.containerView
        contentView.addSubview(fromVC.view)
        contentView.addSubview(toVC.view)
        
        let height = toVC.whiteBoard.frame.height
        let alpha = toVC.bg.alpha
        toVC.bg.alpha = 0
        toVC.whiteBoard.alpha = 0
        toVC.whiteBoard.snp.remakeConstraints { (make) in
            make.height.equalTo(height)
            make.top.equalTo(toVC.view.snp.bottom)
            make.left.right.equalToSuperview()
        }
        toVC.view.layoutIfNeeded()
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                toVC.bg.alpha = alpha
                toVC.whiteBoard.alpha = 1
                toVC.whiteBoard.snp.remakeConstraints { (make) in
                    make.height.equalTo(height)
                    make.left.right.bottom.equalToSuperview()
                }
                toVC.view.layoutIfNeeded()
            })
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            if !transitionContext.transitionWasCancelled {
                contentView.addSubview(fromVC.view)
                contentView.bringSubviewToFront(toVC.view)
            }
        }
    }
}
